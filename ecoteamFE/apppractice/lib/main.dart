import 'dart:async';
import 'dart:convert';

import 'package:apppractice/pages/custom-clip.dart';
import 'package:apppractice/pages/design.dart';
import 'package:apppractice/pages/login_screen.dart';
import 'package:apppractice/pages/signup_screen.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      ),
      home: Login_Screen(),
      routes: {
        Signup_Screen.id: (context) => Signup_Screen(),
      },
    );
  }
}