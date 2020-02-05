import 'package:apppractice/models/basurero.dart';
import 'package:apppractice/pages/ListPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';

class Map_Screen extends StatefulWidget {
  var userData;
  Map_Screen(this.userData);

  static final String id = 'map_screen';
  @override
  _Map_ScreenState createState() => new _Map_ScreenState();
}
 
class _Map_ScreenState extends State<Map_Screen> {
  List<Marker> allMarkers = [];
  String inputaddr = '';
  String inputdias='';
  String inputhorario= '';

  addToList() async {
    final query = inputaddr;
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    Firestore.instance.collection('markers').add({
      'dias': inputdias,
      'horario': inputhorario,
      'location':
          new GeoPoint(first.coordinates.latitude, first.coordinates.longitude),
      'nombre': first.featureName
    });
  }
 
  Future addMarker() async{
    await showDialog(context: context,
    barrierDismissible: true,
    builder: (BuildContext context){
      return new SimpleDialog(
        contentPadding: EdgeInsets.all(10),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0) ),
        title: new Text(
          'Añadir nuevo punto de recolección',
          style: new TextStyle(fontSize: 17.0),

        ),
        children: <Widget>[
          new TextField(
            onChanged: (String enteredLoc){
              setState(() {
                inputaddr = enteredLoc;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Sector'
            ),
          ),
          new TextField(
            onChanged: (String enteredLoc){
              setState(() {
                inputdias = enteredLoc;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Dias de recolección'
            ),
          ),
          new TextField(
            onChanged: (String enteredLoc){
              setState(() {
                inputhorario = enteredLoc;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Horario de recolección'
            ),
          ),
          new SimpleDialogOption(
            child: new Text('Añadir basurero',
            style: new TextStyle( color: Colors.blue),),
            onPressed: (){
              addToList();
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }
  
 
  Widget loadMap() {
    return StreamBuilder(
      stream: Firestore.instance.collection('markers').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('Cargando...Por favor espere.');
        for (int i = 0; i < snapshot.data.documents.length; i++) {
          allMarkers.add(new Marker(
              width: 79.0,
              height: 79.0,
              point: new LatLng(snapshot.data.documents[i]['location'].latitude,
                  snapshot.data.documents[i]['location'].longitude),
              builder: (context) => new Container(
                    child: IconButton(
                      icon: ImageIcon(new AssetImage("assets/images/icon.png"), 
                      color: Colors.green , size: 79.0),

                      onPressed: () {
                        print(snapshot.data.documents[i]['nombre']);
                        showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: <Widget>[
                          Ink(
                           
                           color: Colors.lightGreen,
                           child:ListTile(
                            title: Text(snapshot.data.documents[i]['nombre'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.white)),
                          )),
                          ListTile(
                            title: Text("Horario de recolección:", textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                          ),
                          ListTile(
                            title: Text(snapshot.data.documents[i]['dias'], textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18)),
                                    
                          ),
                          ListTile(
                            title: Text(
                                snapshot.data.documents[i]['horario'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,fontSize: 22, color: Colors.green.shade700)),
                          )
                        ],
                      );
                    });
              
                      },
                    ),
                  )));
        }
        return new FlutterMap(
            options: new MapOptions(
                center: new LatLng(-2.112297, -79.902110), minZoom: 10.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(markers: allMarkers)
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Puntos de recolección', style:TextStyle(color: Colors.white)),
          leading: new IconButton(
            icon: Icon(Icons.add),
            onPressed: addMarker,),
          centerTitle: true,
        ),
        body: loadMap());
  }
  }