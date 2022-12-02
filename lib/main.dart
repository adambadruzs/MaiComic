import 'package:flutter/material.dart';
import 'package:maicomic/screen/crud/postcomics.dart';
import 'package:maicomic/screen/crud/updatecomics.dart';

import '../screen/favorite/favorite.dart';
import '../screen/home/home.dart';
import '../screen/profile/profile.dart';
import 'package:maicomic/screen/home/home.dart';
import 'package:maicomic/screen/login/login.dart';
import 'package:maicomic/screen/splash/splashscreen.dart';

import 'navigator/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
