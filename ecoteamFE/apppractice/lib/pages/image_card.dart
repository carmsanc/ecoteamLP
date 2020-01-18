import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'manejo.dart';
//import 'package:booking_app/src/screens/details.dart';
import 'details.dart';

class ImageCard extends StatelessWidget {
  final String titulo;
  final String picture;
  final Manejo manejo;
  final MaterialAccentColor colori;

  ImageCard(
      {@required this.titulo,
      @required this.picture,
      this.manejo,
      @required this.colori});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: InkWell(
        onTap: () {
      Navigator.push(
              context, MaterialPageRoute(builder: (_) => Details(manejo)));
        },
        child: Container(
                margin:  EdgeInsets.all(10.0),
                //padding: EdgeInsets.all(10.0),
                height: 130.0,
                width: 340,
                decoration: BoxDecoration(
                  color: this.colori,
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(30.0),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: new Offset(0.0, 10.0),
                    )
                  ]                  
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/$picture'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    width: 340.0,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Details(manejo)));
                      },
                      child: Text(
                        '$titulo',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  )
                  ],
                ),
              )
      ),
    );
  }
}
