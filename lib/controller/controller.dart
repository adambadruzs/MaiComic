// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../navigator/butnov.dart';
// import '../screen/favorite/favorite.dart';
// import '../screen/home/home.dart';
// import '../screen/profile/profile.dart';

// class Controller extends StatefulWidget {
//   const Controller({Key? key}) : super(key: key);
//   @override
//   _ControllerState createState() => _ControllerState();
// }

// class _ControllerState extends State<Controller> {
//   int _currentIndex = 0;
//   var lastIndex;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: getCurrentPage(_currentIndex),
//       ),
//       bottomNavigationBar:
//           BottomNavigationTabBarView(_currentIndex, onTabChange: (index) {
//         _currentIndex = index;
//         setState(() {});
//         if (_currentIndex == 3 && _currentIndex == lastIndex) {}
//         lastIndex = index;
//       }),
//     );
//   }

//   getCurrentPage(int index) {
//     if (index == 0) {
//       return Home();
//     } else if (index == 1) {
//       return Favourite();
//     } else if (index == 2) {
//       return Profile();
//     }
//   }
// }
