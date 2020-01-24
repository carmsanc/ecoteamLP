import 'package:apppractice/models/usuarios.dart';
import 'package:apppractice/pages/denuncias_screen.dart';
import 'package:apppractice/pages/inicio_screen.dart';
import 'package:apppractice/pages/map_screen.dart';
import 'package:apppractice/pages/reciclar_screen.dart';
import 'package:apppractice/pages/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home_Screen extends StatefulWidget {
  Home_Screen({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  static final String id = 'home_screen';
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var user;
  int _currentTab = 0;
  PageController _pageController;
  var data;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    print(data);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Inicio_Screen(),
          Map_Screen(user),
          Denuncias_Screen(user),
          Reciclar_Screen(),
          
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
          backgroundColor: Colors.black12,
          currentIndex: _currentTab,
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
            _pageController.animateToPage(index,
                duration: Duration(microseconds: 200),
                curve: Curves.bounceInOut);
          },
          activeColor: Colors.lightGreen[700],
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30.0,
                ),
                title: Text("Inicio", style: TextStyle(fontSize: 9),)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.room, //face, import_contacts,room, home
                  size: 30.0,
                ),
                title: Text("Puntos")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.import_contacts,
                  size: 30.0,
                ),
                title: Text("Denuncias")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.face,
                  size: 30.0,
                ),
                title: Text("Residuos")),
          ]),
    );
  }
}
