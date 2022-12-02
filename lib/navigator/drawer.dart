import 'package:flutter/material.dart';
import 'package:maicomic/screen/favorite/favorite.dart';
import 'package:maicomic/screen/profile/profile.dart';

import '../screen/home/home.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()))),
          _drawerItem(
              icon: Icons.person,
              text: 'Profile',
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()))),
          const Divider(height: 25, thickness: 1),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.bookmark,
              text: 'Favorite',
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Favourite()))),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return const UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(
          image: AssetImage("assets/images/Profile/yuu.png"),
          fit: BoxFit.cover),
    ),
    otherAccountsPictures: [
      ClipOval(
        child: Image(
            image: AssetImage("assets/images/Profile/yuu2.png"),
            fit: BoxFit.cover),
      ),
      ClipOval(
        child: Image(
            image: AssetImage("assets/images/Profile/yuu3.png"),
            fit: BoxFit.cover),
      )
    ],
    accountName: Text('Adam Badruzzaman'),
    accountEmail: Text('adambadruzs@gmail.com'),
  );
}

Widget _drawerItem(
    {IconData? icon, required String text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
