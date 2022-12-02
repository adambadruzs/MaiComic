import 'package:flutter/material.dart';
import 'package:maicomic/model/Comic.dart';

import '../../service/maicomic_services.dart';
import '../profile/profile.dart';

class DetailComicManhua extends StatelessWidget {
  final ComicModel comic;
  DetailComicManhua({Key? key, required this.comic}) : super(key: key);

  Color favIconcolor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Colors.black,
        //   ),
        //   onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        // ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.person_rounded,
        //         color: Color.fromARGB(255, 0, 0, 0)),
        //     onPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => const Profile()));
        //     },
        //   ),
        // ],
      ),
      body: FutureBuilder<List<ComicModel>>(
        future: ComicService().fetchDataComicManhua(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Column(
                children: <Widget>[
                  Container(
                    width: 600,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(16),
                    //     image: DecorationImage(
                    //       fit: BoxFit.fill,
                    //       // fit: BoxFit.cover,
                    //       image: AssetImage("${comic.cover}"),
                    //     )),
                    child: Image.asset(
                      comic.cover,
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
                              child: Text("${comic.name}",
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                            Text(
                              "Chapter : ${comic.episode}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 49, 49, 49)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Studio : ${comic.studio}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 49, 49, 49)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Status : ${comic.status}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 49, 49, 49)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Type : ${comic.type}",
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
                      "${comic.description}",
                      style: Theme.of(context).textTheme.bodyText1,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              );
            }
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   child: Icon(Icons.favorite, color: favIconcolor),
      //   onPressed: () {
      //     setState(() {
      //       if (favIconcolor == Colors.grey) {
      //         favIconcolor = Colors.red.shade700;
      //       } else {
      //         favIconcolor = Colors.grey;
      //       }
      //     });
      //   },
      // ),
    );
  }
}
