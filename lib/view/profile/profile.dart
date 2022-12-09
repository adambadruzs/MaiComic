import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:maicomic/constant/constant.dart';
import 'package:maicomic/view/home/home.dart';

import '../../model/User.dart';
import '../../navigator/drawer.dart';
import '../../service/maicomic_services.dart';

class Profile extends StatefulWidget {
  // final UserModel user;
  int user;
  Profile({Key? key, required this.user}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            ),
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            user: widget.user,
                          )));
            },
          ),
        ),
        body: FutureBuilder<UserModel>(
            future: ComicService().fetchDataUser(widget.user),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 50),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 125,
                              width: 125,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/Profile/yuu.png"),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  child: const Text("Nama",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                      )),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: controllerUsername,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins Light',
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: snapshot.data!.username,
                                    hintText: "Ganti Nama",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 18),
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Poppins Light',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: const Text("Email",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                      )),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: controllerEmail,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins Light',
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: snapshot.data!.email,
                                    hintText: "Ganti Email",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 18),
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Poppins Light',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  child: const Text("Password",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                      )),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  obscureText: true,
                                  controller: controllerPassword,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins Light',
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: snapshot.data!.password,
                                    hintText: "Ganti Password",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 18),
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Poppins Light',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    Dio dio = Dio();
                                    var baseUrlApi = ComicService().baseUrlApi;

                                    int id = snapshot.data!.id;

                                    if (controllerEmail.text == "") {
                                      Map<String, dynamic> uploadDataData = {
                                        // ignore: unnecessary_string_interpolations
                                        'username': controllerUsername.text,
                                        'email': snapshot.data!.email,
                                        'password': controllerPassword.text,
                                      };
                                      var responseApi = await dio.put(
                                          '$baseUrlApi/users/$id',
                                          data: uploadDataData);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Profile(
                                                    user: widget.user,
                                                  )));
                                    } else if (controllerUsername.text == "") {
                                      Map<String, dynamic> uploadDataData = {
                                        // ignore: unnecessary_string_interpolations
                                        'username': snapshot.data!.username,
                                        'email': controllerEmail.text,
                                        'password': controllerPassword.text,
                                      };
                                      var responseApi = await dio.put(
                                          '$baseUrlApi/users/$id',
                                          data: uploadDataData);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Profile(
                                                    user: widget.user,
                                                  )));
                                    } else if (controllerPassword.text == "") {
                                      Map<String, dynamic> uploadDataData = {
                                        // ignore: unnecessary_string_interpolations
                                        'username': controllerUsername.text,
                                        'email': controllerEmail.text,
                                        'password': snapshot.data!.password,
                                      };
                                      var responseApi = await dio.put(
                                          '$baseUrlApi/users/$id',
                                          data: uploadDataData);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Profile(
                                                    user: widget.user,
                                                  )));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orangeAccent,
                                      minimumSize: const Size.fromHeight(55),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                  child: const Text("UPDATE",
                                      style: TextStyle(
                                        fontFamily: 'Poppins SemiBold',
                                        fontSize: 18,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        )),
                  );
                }
              }
            }));
  }
}
