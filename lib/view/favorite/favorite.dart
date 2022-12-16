import 'package:flutter/material.dart';
import 'package:maicomic/constant/constant.dart';
import 'package:maicomic/model/Studio.dart';
import 'package:maicomic/navigator/tab.dart';
import 'package:maicomic/view/detail/detailComic.dart';

import 'package:maicomic/view/login/login.dart';
import 'package:maicomic/view/profile/profile.dart';
import 'package:maicomic/viewmodel/maicomic_services.dart';

import '../../model/Comic.dart';

import '../../model/User.dart';
import '../../navigator/drawer.dart';
import '../crud/crud.dart';

class Favorite extends StatefulWidget {
  // final UserModel user;
  int user;
  Favorite({Key? key, required this.user}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int _currentIndex = 0;
  var lastIndex;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Crud(user: widget.user),
                    ));
                  },
                  child: const Icon(
                    Icons.add_box_outlined,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        drawer: DrawerWidget(
          user: widget.user,
        ),
        body: FutureBuilder<List<ComicModel>>(
          future: ComicService().fetchDataComicFav(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Container(
                    color: black,
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailComic(
                                            comic: snapshot.data![index],
                                            user: widget.user,
                                            fetchcomic: ComicService()
                                                .fetchDataComicManhua(),
                                          )));
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 190,
                                  width: 400,
                                  child: Image.asset(
                                    snapshot.data![index].cover,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                    padding: const EdgeInsets.only(right: 140),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].name,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        ),
                                        const SizedBox(height: 15),
                                        Text(
                                          "Chapter ${snapshot.data![index].episode}",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: white,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    )),
                              ],
                            ),
                          );
                        }));
              }
            }
          },
        ));
  }
}
