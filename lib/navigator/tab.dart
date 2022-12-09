import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maicomic/constant/constant.dart';
import 'package:maicomic/controller/controller.dart';
import 'package:maicomic/navigator/drawer.dart';
import 'package:maicomic/view/crud/crud.dart';
import '../model/User.dart';
import '../view/home/home.dart';
import '../view/profile/profile.dart';

class TabsController extends StatelessWidget {
  // final UserModel user;
  int user;
  var Tab1, Tab2, Tab3, Tab4;
  TabsController(
      {required this.Tab1,
      required this.Tab2,
      required this.Tab3,
      required this.Tab4,
      required this.user});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
          title: const Text(
            'MaiComic',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Poppins Bold',
              fontSize: 20,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'Semua',
              ),
              Tab(
                text: 'Manga',
              ),
              Tab(
                text: 'Manhua',
              ),
              Tab(
                text: 'Manhwa',
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Crud(user: user),
                    ));
                  },
                  child: const Icon(
                    Icons.add_box_outlined,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        drawer: DrawerWidget(
          user: user,
        ),
        body: TabBarView(
          children: <Widget>[Tab1, Tab2, Tab3, Tab4],
        ),
        // bottomNavigationBar: Controller(),
        // bottomNavigationBar: Butnov(onTabChange: null,),
      ),
    );
  }
}
