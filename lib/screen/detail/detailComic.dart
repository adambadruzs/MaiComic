import 'package:flutter/material.dart';

import '../../service/maicomic_services.dart';
import '../profile/profile.dart';

class DetailComic extends StatefulWidget {
  const DetailComic({Key? key}) : super(key: key);

  @override
  State<DetailComic> createState() => _DetailComicState();
}

class _DetailComicState extends State<DetailComic> {
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
      body: Expanded(
        child: FutureBuilder<List<dynamic>>(
          future: ComicService.getDataComic(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            width: 600,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  // fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "${snapshot.data![index]['cCover']}"),
                                )),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                              "${snapshot.data![index]['cName']}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6),
                                        ),
                                        Text(
                                          "${snapshot.data![index]['cEpisode']}",
                                          style: TextStyle(
                                              color: Colors.grey[700]),
                                        ),
                                        Text(
                                          "${snapshot.data![index]['cStudio']}",
                                          style: TextStyle(
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              "${snapshot.data![index]['cDescription']}",
                              style: Theme.of(context).textTheme.bodyText1,
                              softWrap: true,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      );
                    });
              }
            }
          },
        ),
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
