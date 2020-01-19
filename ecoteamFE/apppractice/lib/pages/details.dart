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
              //Spacer(),
          Container(
                margin:  EdgeInsets.only(left:0.0, right: 200.0, top: 30),
                //padding: EdgeInsets.all(20.0),
                //height: 80.0,
                width: 200,
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
                child: Container(
                  padding: EdgeInsets.only(top: 6, left: 27, bottom: 6),
                    child: 
                     Text(
                        'Dónde va?',
                        style: TextStyle(color: Colors.black, fontSize: 17.0),
                      ),               
                ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: 
                  Text(
                    'Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 0.5,
                      fontSize: 17,
                    ),
                  ), 
                ),
                Expanded(child: Image.asset('assets/images/${manejo.icono}'),)
              ],
            ),
          )  
        ],
      ),
    );
  }
}
