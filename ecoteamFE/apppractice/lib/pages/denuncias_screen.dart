import 'package:flutter/material.dart';

class Denuncias_Screen extends StatefulWidget {
   var userData;
   Denuncias_Screen(this.userData);

    static final String id = 'denuncias_screen';
  @override
  _Denuncias_ScreenState createState() => _Denuncias_ScreenState();
}

class _Denuncias_ScreenState extends State<Denuncias_Screen> {
  void initState() {
    print(widget.userData);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: Text("Denuncias"),
        ),
        SizedBox(
          height: 300,
        ),

      ],
    ));
  }
}