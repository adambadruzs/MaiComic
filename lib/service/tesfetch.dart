// import 'package:flutter/material.dart';
// import 'package:maicomic/constant/constant.dart';
// import 'package:maicomic/screen/detail/detailComic.dart';
// import 'package:maicomic/screen/detail/detailManga.dart';
// import 'package:maicomic/screen/detail/detailManhua.dart';
// import 'package:maicomic/screen/detail/detailManhwa.dart';
// import 'package:maicomic/screen/login/login.dart';
// import 'package:maicomic/service/maicomic_services.dart';

// import '../../model/Comic.dart';

// class Home extends StatefulWidget {
//   Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget tabSemua = FutureBuilder<List<ComicModel>>(
//       future: ComicService.fetchDataComic(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           } else {
//             return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   DetailComic(comic: snapshot.data![index])));
//                     },
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 190,
//                           width: 400,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image:
//                                 NetworkImage("${snapshot.data![index].cCover}"),
//                           )),
//                         ),
//                         const SizedBox(height: 10),
//                         Padding(
//                             padding: const EdgeInsets.only(right: 140),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "${snapshot.data![index].cName}",
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   "${snapshot.data![index].cDescription}",
//                                   style: const TextStyle(
//                                     fontSize: 13,
//                                     color: Color.fromARGB(137, 0, 0, 0),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 Text(
//                                   "Chapter ${snapshot.data![index].cEpisode}",
//                                   style: const TextStyle(
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w500,
//                                     color: Color.fromARGB(137, 0, 0, 0),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                               ],
//                             )),
//                       ],
//                     ),
//                   );
//                 });
//           }
//         }
//       },
//     );

//     Widget tabManga = FutureBuilder<List<ComicModel>>(
//       future: ComicService.fetchDataComicManga(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           } else {
//             return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => DetailComicManga(
//                                   comic: snapshot.data![index])));
//                     },
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 190,
//                           width: 400,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image:
//                                 NetworkImage("${snapshot.data![index].cCover}"),
//                           )),
//                         ),
//                         const SizedBox(height: 10),
//                         Padding(
//                             padding: const EdgeInsets.only(right: 140),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "${snapshot.data![index].cName}",
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   "${snapshot.data![index].cDescription}",
//                                   style: const TextStyle(
//                                     fontSize: 13,
//                                     color: Color.fromARGB(137, 0, 0, 0),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 Text(
//                                   "Chapter ${snapshot.data![index].cEpisode}",
//                                   style: const TextStyle(
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w500,
//                                     color: Color.fromARGB(137, 0, 0, 0),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                               ],
//                             )),
//                       ],
//                     ),
//                   );
//                 });
//           }
//         }
//       },
//     );

//     Widget tabManhua = FutureBuilder<List<ComicModel>>(
//       future: ComicService.fetchDataComicManhua(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           } else {
//             return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => DetailComicManhua(
//                                   comic: snapshot.data![index])));
//                     },
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 190,
//                           width: 400,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image:
//                                 NetworkImage("${snapshot.data![index].cCover}"),
//                           )),
//                         ),
//                         const SizedBox(height: 10),
//                         Padding(
//                             padding: const EdgeInsets.only(right: 140),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "${snapshot.data![index].cName}",
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   "${snapshot.data![index].cDescription}",
//                                   style: const TextStyle(
//                                     fontSize: 13,
//                                     color: Color.fromARGB(137, 0, 0, 0),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 Text(
//                                   "Chapter ${snapshot.data![index].cEpisode}",
//                                   style: const TextStyle(
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w500,
//                                     color: Color.fromARGB(137, 0, 0, 0),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                               ],
//                             )),
//                       ],
//                     ),
//                   );
//                 });
//           }
//         }
//       },
//     );

//     Widget tabManhwa = FutureBuilder<List<ComicModel>>(
//       future: ComicService.fetchDataComicManhwa(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           } else {
//             return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => DetailComicManhwa(
//                                   comic: snapshot.data![index])));
//                     },
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 190,
//                           width: 400,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image:
//                                 NetworkImage("${snapshot.data![index].cCover}"),
//                           )),
//                         ),
//                         const SizedBox(height: 10),
//                         Padding(
//                             padding: const EdgeInsets.only(right: 140),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "${snapshot.data![index].cName}",
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   "${snapshot.data![index].cDescription}",
//                                   style: const TextStyle(
//                                     fontSize: 13,
//                                     color: Color.fromARGB(137, 0, 0, 0),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 Text(
//                                   "Chapter ${snapshot.data![index].cEpisode}",
//                                   style: const TextStyle(
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w500,
//                                     color: Color.fromARGB(137, 0, 0, 0),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                               ],
//                             )),
//                       ],
//                     ),
//                   );
//                 });
//           }
//         }
//       },
//     );

//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//           elevation: 0,
//           title: const Text(
//             'MaiComic',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: 'Poppins Bold',
//               fontSize: 20,
//             ),
//           ),
//           bottom: const TabBar(
//             indicatorColor: Colors.white,
//             tabs: [
//               Tab(
//                 text: 'Semua',
//               ),
//               Tab(
//                 text: 'Manga',
//               ),
//               Tab(
//                 text: 'Manhua',
//               ),
//               Tab(
//                 text: 'Manhwa',
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             Padding(
//                 padding: const EdgeInsets.only(right: 20.0),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: const Icon(
//                     Icons.add_box_outlined,
//                     size: 26.0,
//                   ),
//                 )),
//           ],
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             tabSemua,
//             tabManga,
//             tabManhua,
//             tabManhwa,
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                   backgroundColor: Color.fromARGB(255, 32, 32, 32)),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.bookmark),
//                   label: 'Favorite',
//                   backgroundColor: Color.fromARGB(255, 32, 32, 32)),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//                 backgroundColor: Color.fromARGB(255, 32, 32, 32),
//               ),
//             ],
//             type: BottomNavigationBarType.shifting,
//             currentIndex: _selectedIndex,
//             selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
//             iconSize: 30,
//             onTap: _onItemTapped,
//             elevation: 5),
//       ),
//     );
//   }
// }
