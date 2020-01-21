import 'package:apppractice/pages/denuncias_screen.dart';
import 'package:apppractice/pages/inicio_screen.dart';
import 'package:apppractice/pages/map_screen.dart';
import 'package:apppractice/pages/reciclar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  static final String id = 'home_screen';
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int _currentTab = 0;
  PageController _pageController;
  var data;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    data = widget.user.email;
    print(data);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Inicio_Screen(data),
          Map_Screen(data),
          Denuncias_Screen(data),
          Reciclar_Screen(data),
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
                title: Text("Inicio")),
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
                title: Text("Residuos")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.face,
                  size: 30.0,
                ),
                title: Text("Denuncias")),
          ]),
    );
  }
}
