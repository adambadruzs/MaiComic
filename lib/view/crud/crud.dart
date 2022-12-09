import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maicomic/view/crud/deletecomics.dart';
import 'package:maicomic/view/crud/postcomics.dart';
import 'package:maicomic/view/crud/updatecomics.dart';
import 'package:maicomic/view/home/home.dart';

import '../../constant/constant.dart';
import '../../model/User.dart';
import '../../navigator/drawer.dart';

class Crud extends StatefulWidget {
  // final UserModel user;
  int user;
  Crud({Key? key, required this.user}) : super(key: key);

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
          centerTitle: true,
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
        drawer: DrawerWidget(
          user: widget.user,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostComics(
                                  user: widget.user,
                                )));
                  },
                  child: const Text('Post Comics')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateComics(
                                    user: widget.user,
                                  )));
                    }
                  },
                  child: const Text('Update Comics')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeleteComics(
                                    user: widget.user,
                                  )));
                    }
                  },
                  child: const Text('Delete Comics')),
            ],
          ),
        ));
  }
}
