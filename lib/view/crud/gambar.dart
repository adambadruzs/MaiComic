import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:maicomic/view/home/home.dart';
import 'package:maicomic/service/maicomic_services.dart';

class gambars extends StatefulWidget {
  const gambars({Key? key}) : super(key: key);

  @override
  State<gambars> createState() => _gambarsState();
}

class _gambarsState extends State<gambars> {
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        title: const Text(
          'MaiComic',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Poppins Bold',
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 23),
            child: Column(
              children: [
                const SizedBox(height: 18),
                imageFile == null
                    ? const Icon(Icons.add_photo_alternate)
                    : Column(
                        children: [
                          SizedBox(
                            width: 500,
                            height: 500,
                            child: Image.file(
                              imageFile!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                uploadData();
                              },
                              child: const Text('Submit')),
                        ],
                      ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    _getFromGallery();
                  },
                  child: const Text('Pick From Gallery'),
                ),
              ],
            )),
      ),
    );
  }

  _getFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(
          image.path,
        );
      });
    }
  }

  uploadData() async {
    Dio dio = Dio();
    //image sender
    // var baseUrl = ComicService().baseUrl;
    // var baseUrl = 'http://10.115.21.35:57330'; //Dio error
    // var baseUrl = 'http://192.168.43.7:3000'; //Dio error
    // var baseUrl = 'http://192.168.43.7:3000'; //Dio error
    // var baseUrl = 'http://140.213.219.22:57330'; //No Respond HP
    var Emu = ComicService().Emu; //Emu //No Respond HP

    //db.json
    var baseUrlApi = ComicService().baseUrlApi; //Kos
    // var baseUrlApi = 'http://192.168.30.64:3000'; //`Hp
    var formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imageFile!.path),
    });
    var response = await dio.post('$Emu/upload', data: formData);
    var covers = response.data.toString();
    covers = covers.replaceAll(RegExp('[{name: }]'), '');
    // var covers = Storage;
    debugPrint(covers);

    Map<String, dynamic> uploadDataData = {
      // ignore: unnecessary_string_interpolations
      'cover': 'assets/images/Cover/$covers',
    };
    var responseApi =
        await dio.post('$baseUrlApi/comics', data: uploadDataData);
    debugPrint(responseApi.data.toString());

    // Navigator.push(context, MaterialPageRoute(builder: (context) => gambars()));
  }
}
