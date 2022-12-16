import 'package:flutter/material.dart';
import 'package:maicomic/view/crud/postcomics.dart';
import 'package:maicomic/view/crud/updatecomics.dart';

import 'view/home/home.dart';
import 'view/profile/profile.dart';
import 'package:maicomic/view/home/home.dart';
import 'package:maicomic/view/login/login.dart';
import 'package:maicomic/view/splash/splashscreen.dart';

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
      home: SplashScreen(),
    );
  }
}
