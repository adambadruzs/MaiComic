import 'package:flutter/material.dart';
import 'package:maicomic/constant/constant.dart';
import 'package:maicomic/model/Studio.dart';
import 'package:maicomic/navigator/tab.dart';
import 'package:maicomic/view/detail/detailComic.dart';

import 'package:maicomic/view/login/login.dart';
import 'package:maicomic/view/profile/profile.dart';
import 'package:maicomic/service/maicomic_services.dart';

import '../../model/Comic.dart';

import '../../model/User.dart';

class Home extends StatefulWidget {
  // final UserModel user;
  int user;
  Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  var lastIndex;

  @override
  Widget build(BuildContext context) {
    Widget tabSemua = FutureBuilder<List<ComicModel>>(
      future: ComicService().fetchDataComic(),
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
                                      fetchcomic:
                                          ComicService().fetchDataComic(),
                                      // studio: StudioModel(id: s,name: )
                                    )));
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 190,
                            width: 400,
                            // decoration: BoxDecoration(
                            //     image: DecorationImage(
                            //   fit: BoxFit.fill,
                            //   image: AssetImage(snapshot.data![index].cover),
                            // )),
                            child: Image.asset(
                              snapshot.data![index].cover,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                              padding: const EdgeInsets.only(right: 140),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    snapshot.data![index].description,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: white,
                                    ),
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
                  }),
            );
          }
        }
      },
    );

    Widget tabManga = FutureBuilder<List<ComicModel>>(
      future: ComicService().fetchDataComicManga(),
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
                                            .fetchDataComicManga(),
                                        // studio: StudioModel(id: s,name: )
                                      )));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 190,
                              width: 400,
                              // decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //   fit: BoxFit.fill,
                              //   image: AssetImage(snapshot.data![index].cover),
                              // )),
                              child: Image.asset(
                                snapshot.data![index].cover,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                                padding: const EdgeInsets.only(right: 140),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].name,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: white),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      snapshot.data![index].description,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: white,
                                      ),
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
    );

    Widget tabManhua = FutureBuilder<List<ComicModel>>(
      future: ComicService().fetchDataComicManhua(),
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
                                        // studio: StudioModel(id: s,name: )
                                      )));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 190,
                              width: 400,
                              // decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //   fit: BoxFit.fill,
                              //   image: AssetImage(snapshot.data![index].cover),
                              // )),
                              child: Image.asset(
                                snapshot.data![index].cover,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                                padding: const EdgeInsets.only(right: 140),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].name,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: white),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      snapshot.data![index].description,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: white,
                                      ),
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
    );

    Widget tabManhwa = FutureBuilder<List<ComicModel>>(
      future: ComicService().fetchDataComicManhwa(),
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
                                      fetchcomic:
                                          ComicService().fetchDataComicManhwa(),
                                      // studio: StudioModel(id: s,name: )
                                    )));
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 190,
                            width: 400,
                            // decoration: BoxDecoration(
                            //     image: DecorationImage(
                            //   fit: BoxFit.fill,
                            //   image: AssetImage(snapshot.data![index].cover),
                            // )),
                            child: Image.asset(
                              snapshot.data![index].cover,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                              padding: const EdgeInsets.only(right: 140),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    snapshot.data![index].description,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: white,
                                    ),
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
                  }),
            );
          }
        }
      },
    );

    return TabsController(
      Tab1: tabSemua,
      Tab2: tabManga,
      Tab3: tabManhua,
      Tab4: tabManhwa,
      user: widget.user,
    );
  }
}
