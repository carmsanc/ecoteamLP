import 'package:flutter/material.dart';
import 'scrollView.dart';

class Reciclar_Screen extends StatefulWidget {
  var userData;
  Reciclar_Screen(this.userData);
  static final String id = 'reciclar_screen';
  @override
  _Reciclar_ScreenState createState() => _Reciclar_ScreenState();
}

class _Reciclar_ScreenState extends State<Reciclar_Screen> {
  void initState() {
      print(widget.userData);
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
          child: Column(
            children: <Widget>[
              Expanded(child: Container(child: ImageCards()))
            ],)
          
        )
    );
  }
}