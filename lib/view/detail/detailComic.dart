import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:maicomic/constant/constant.dart';
import 'package:maicomic/model/Comic.dart';
import 'package:maicomic/model/Studio.dart';

import '../../model/User.dart';

import '../../viewmodel/maicomic_services.dart';
import '../profile/profile.dart';

class DetailComic extends StatefulWidget {
  final ComicModel comic;
  int user;
  Future<List<ComicModel>> fetchcomic;
  DetailComic(
      {Key? key,
      required this.comic,
      required this.user,
      required this.fetchcomic})
      : super(key: key);

  @override
  State<DetailComic> createState() => _DetailComicState();
}

class _DetailComicState extends State<DetailComic> {
  Dio dio = Dio();
  bool isFavorite = false;
  // getStudio() async {
  //   var studioId = comic.studioId;
  //   var getstudio = await ComicService().fetchDataStudio(studioId);
  //   return getstudio.toString();
  // }

  @override
  void initState() {
    isFavorite = widget.comic.isFavorite;
    super.initState();
  }

  void addFavorite(String cover, name, status, type, description, int studioId,
      id, episode, isFavorite) async {
    try {
      var response = await Dio().patch(
        ComicService().baseUrlApi + "/comics/$id",
        data: {
          "cover": cover,
          "name": name,
          "status": status,
          "type": type,
          "description": description,
          "studioId": studioId,
          "id": id,
          "episode": episode,
          "isFavorite": isFavorite
        },
      );
      if (response.statusCode == 200) {
        print("Success");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget StudiosModel = FutureBuilder<StudioModel>(
        future: ComicService().fetchDataStudioModel(widget.comic.studioId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Text("Studio : " + snapshot.data!.name);
            }
          }
        });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: FutureBuilder<List<ComicModel>>(
        future: widget.fetchcomic,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 395,
                      height: 470,
                      child: Image.asset(
                        widget.comic.cover,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("${widget.comic.name}",
                                    style:
                                        Theme.of(context).textTheme.headline6),
                              ),
                              Text(
                                "Chapter : ${widget.comic.episode}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49)),
                              ),
                              SizedBox(height: 10),
                              StudiosModel,
                              SizedBox(height: 10),
                              Text(
                                "Status : ${widget.comic.status}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49)),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Type : ${widget.comic.type}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "${widget.comic.description}",
                        style: Theme.of(context).textTheme.bodyText1,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
            addFavorite(
                widget.comic.cover,
                widget.comic.name,
                widget.comic.status,
                widget.comic.type,
                widget.comic.description,
                widget.comic.studioId,
                widget.comic.id,
                widget.comic.episode,
                isFavorite);
          });
        },
        child: Icon(
          Icons.favorite,
          color: isFavorite == false ? extraLightGrey : Colors.red,
        ),
      ),
    );
  }
}
