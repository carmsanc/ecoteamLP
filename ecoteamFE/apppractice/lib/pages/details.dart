import 'package:flutter/material.dart';
//import 'package:booking_app/src/models/places.dart';
import 'manejo.dart';

class Details extends StatelessWidget {
  final Manejo manejo;

  Details(this.manejo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: <Widget>[
          
          Container(
                margin:  EdgeInsets.only(left:10.0, right: 10.0, top: 30),
                //padding: EdgeInsets.all(20.0),
                height: 80.0,
                width: 340,
                decoration: BoxDecoration(
                  color: manejo.colori,
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
                child: Center(
                    child: 
                     Text(
                        '${manejo.titulo}',
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      ),               
                ),
              ),
          
              
        ],
      ),
    );
  }
}
