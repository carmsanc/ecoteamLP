import 'package:flutter/material.dart';

class Inicio_Screen extends StatefulWidget {
  var userData;
  Inicio_Screen(this.userData);
  static final String id = 'inicio_screen';
  @override
  _Inicio_ScreenState createState() => _Inicio_ScreenState();
}

class _Inicio_ScreenState extends State<Inicio_Screen> {
  List notice = List();

  void initState() {
    print(widget.userData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          Container(
              //padding: EdgeInsets.only(bottom: 10),
              //height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "ECO TEAM",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 30.0,
                        fontFamily: 'Chewy'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/perfil.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              )),
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            height: 180,
            decoration: BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  "Familia Suarez",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
                Text(
                  "Alborada 6ta etapa",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Guayaquil, Ecuador",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          )
           
        ]));
  }
}
