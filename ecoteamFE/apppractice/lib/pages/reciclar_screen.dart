import 'package:flutter/material.dart';
import 'scrollView.dart';

class Reciclar_Screen extends StatefulWidget {
  
  static final String id = 'reciclar_screen';
  @override
  _Reciclar_ScreenState createState() => _Reciclar_ScreenState();
}

class _Reciclar_ScreenState extends State<Reciclar_Screen> {
  void initState() {
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(
                    "Manejo de residuos",
                    style: TextStyle(color: Colors.white),
                  ),
                  
                  
                    )
                  ,
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(child: Container(child: ImageCards()))
            ],)
          
        )
    );
  }
}