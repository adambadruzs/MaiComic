import 'package:flutter/material.dart';
import 'package:maicomic/constant/constant.dart';
import 'package:maicomic/screen/detail/detailComic.dart';
import 'package:maicomic/screen/login/login.dart';
import 'package:maicomic/service/maicomic_services.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
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
        // bottom: const TabBar(
        //   tabs: [
        //     Tab(
        //       text: 'Semua',
        //     ),
        //     Tab(
        //       text: 'Manga',
        //     ),
        //     Tab(
        //       text: 'Manhua',
        //     ),
        //     Tab(
        //       text: 'Manhwa',
        //     ),
        //   ],
        // ),
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Color.fromARGB(255, 255, 255, 255),
        //   ),
        //   onPressed: () => Login(),
        // ),
        // actions: <Widget>[],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 1),
          Expanded(
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
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailComic()));
                            },
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 250,
                                    width: 500,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${snapshot.data![index]['cCover']}"),
                                    )),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        "${snapshot.data![index]['cName']}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "${snapshot.data![index]['cDescription']}",
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color.fromARGB(137, 0, 0, 0),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        "Chapter ${snapshot.data![index]['cEpisode']}",
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color.fromARGB(137, 0, 0, 0),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Color.fromARGB(255, 32, 32, 32)),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Favorite',
                backgroundColor: Color.fromARGB(255, 32, 32, 32)),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Color.fromARGB(255, 32, 32, 32),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 255, 255, 255),
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
