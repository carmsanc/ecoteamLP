
import 'package:apppractice/pages/home_screen.dart';
import 'package:apppractice/pages/login_screen.dart';
import 'package:apppractice/pages/signup_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  Widget _getScreenId() {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECOTEAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Chewy'
      ),
      home: Login_Screen(),
      routes: {
        Home_Screen.id: (context) => Home_Screen()
      },
    );
  }
}