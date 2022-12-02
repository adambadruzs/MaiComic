import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maicomic/constant/constant.dart';

import '../screen/favorite/favorite.dart';
import '../screen/home/home.dart';
import '../screen/profile/profile.dart';

class BottomNavigationTabBarView extends StatelessWidget {
  var _currentIndex = 0;
  Function onTabChange;

  BottomNavigationTabBarView(this._currentIndex, {required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return bottomNavigationTabBarView();
  }

  BottomNavigationBar bottomNavigationTabBarView() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: black,
      selectedItemColor: white,
      unselectedItemColor: butnov,
      iconSize: 30,
      onTap: onTabTapped,
      elevation: 5,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  void onTabTapped(int index) {
    _currentIndex = index;
    onTabChange(index);
  }
}
