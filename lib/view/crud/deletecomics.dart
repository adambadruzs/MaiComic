import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:maicomic/view/home/home.dart';
import 'package:maicomic/viewmodel/maicomic_services.dart';

import '../../model/User.dart';

class DeleteComics extends StatefulWidget {
  int user;
  DeleteComics({Key? key, required this.user}) : super(key: key);

  @override
  State<DeleteComics> createState() => _DeleteComicsState();
}

class _DeleteComicsState extends State<DeleteComics> {
  TextEditingController id = TextEditingController();

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
                const SizedBox(height: 25),
                TextField(
                  controller: id,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Masukkan ID Comics',
                    hintText: 'Masukkan ID Comics',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      uploadData();
                    },
                    child: const Text('Submit')),
                const SizedBox(height: 18),
              ],
            )),
      ),
    );
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

    var responseApi = await dio.delete('$baseUrlApi/comics/${id.text}');
    debugPrint(responseApi.data.toString());

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Home(user: widget.user)));
  }
}
