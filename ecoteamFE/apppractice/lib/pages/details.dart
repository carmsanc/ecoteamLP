import 'package:apppractice/pages/reciclar_screen.dart';
import 'package:flutter/material.dart';
//import 'package:booking_app/src/models/places.dart';
import 'manejo.dart';

class Details extends StatelessWidget {
  final Manejo manejo;

  Details(this.manejo);

  Widget showTitle(){
    return new Container(
      margin:  EdgeInsets.only(left:10.0, right: 10.0, top: 30),
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
              style: TextStyle(color: Colors.black, fontSize: 22.0),
            ),               
      ),
    );
  }

  Widget showSubtitle(frase){
    return new Container(
      margin:  EdgeInsets.only(left:0.0, right: 200.0, top: 30),
      //padding: EdgeInsets.all(20.0),
      //height: 80.0,
      width: 200,
      decoration: BoxDecoration(
        color: manejo.colori,
        shape: BoxShape.rectangle,               
      ),
      child: Container(
        padding: EdgeInsets.only(top: 6, left: 27, bottom: 6),
          child: 
            Text(
              frase,
              style: TextStyle(color: Colors.black, fontSize: 17.0),
            ),               
      ),
    );
  }
  
  Widget showContain(){
    return new Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: 
                  Text(
                    '${manejo.donde}',
                    style: TextStyle(
                      color: Colors.black,
                      
                      letterSpacing: 0.5,
                      fontSize: 17,
                    ),
                  ), 
                ),
                Expanded(child: Image.asset('assets/images/${manejo.tacho}'),)
              ],
            ),
          )  ;
  }
  
  Widget showContainRecycle(){
    return new Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: 
                  Text(
                    '${manejo.como}',
                    style: TextStyle(
                      color: Colors.black,
                      
                      letterSpacing: 0.5,
                      fontSize: 17,
                    ),
                  ), 
                ),
                //Expanded(child: Image.asset(imagen),)
              ],
            ),
          )  ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(
                    "Puntos de recolección",
                    style: TextStyle(color: Colors.white),
                  ),
                  elevation: 0.0,
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 16.0, 0.0),
                      child: IconButton(
                          icon: Icon(Icons.arrow_left, color: Colors.white),
                          onPressed: () {
                            //go to listview
                            print('mira la lista');
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Reciclar_Screen()));
                          }),
                    )
                  ],),
      body: Container(
        //padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: new Form(
          
          child: new ListView(
            shrinkWrap: true,
            
            children: <Widget>[
              showTitle(),
              showSubtitle("¿Dónde va?"),
              showContain(),
              showSubtitle("¿Cómo reciclar?"),
              showContainRecycle()
            ],
          ),
        ))
    );
  }
}