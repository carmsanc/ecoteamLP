import 'package:apppractice/models/basurero.dart';
import 'package:apppractice/pages/ListPage.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class Map_Screen extends StatefulWidget {
  var userData;
  Map_Screen(this.userData);

  static final String id = 'map_screen';

  @override
  _Map_ScreenState createState() => _Map_ScreenState();
}

List<Marker> allMarkers = [];
setMarkers() {
  allMarkers.add(new Marker(
      width: 45.0,
      height: 45.0,
      point: new LatLng(-2.113077, -79.903139),
      builder: (context) => new Container(
            child: IconButton(
              icon: Icon(Icons.location_on),
              color: Colors.greenAccent,
              iconSize: 45.0,
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: <Widget>[
                          Ink(
                           color: Colors.lightGreen,
                           child:ListTile(
                            title: Text("Basurero Samanes #3",
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
                            title: Text("Lunes y Miércoles", textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18)),
                                    
                          ),
                          ListTile(
                            title: Text(
                                "19:30 - 22:30",
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
  allMarkers.add(new Marker(
      width: 45.0,
      height: 45.0,
      point: new LatLng(-2.112278, -79.899572),
      builder: (context) => new Container(
            child: IconButton(
              icon: Icon(Icons.location_on),
              color: Colors.green,
              iconSize: 45.0,
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: <Widget>[
                          Ink(
                           color: Colors.lightGreen,
                           child:ListTile(
                            title: Text("Basurero Samanes #2",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.white)),
                          )),
                          ListTile(
                            title: Text(" Horario de recolección:", textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22) ),
                          ),
                          ListTile(
                            title: Text("Martes y Jueves", textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18)),
                          ),
                          ListTile(
                            title: Text(
                                "21:30 - 23:30",
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
  allMarkers.add(new Marker(
      width: 45.0,
      height: 45.0,
      point: new LatLng(-2.112297, -79.902110),
      builder: (context) => new Container(
            child: IconButton(
              icon: Icon(Icons.location_on),
              color: Colors.red,
              iconSize: 45.0,
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: <Widget>[
                          Ink(
                           color: Colors.lightGreen,
                           child:ListTile(
                            title: Text("Basurero Samanes #1",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.white)),
                          )),
                         ListTile(
                            title: Text("Horario de recolección:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            
                          ),
                          ListTile(
                            title: Text(
                                "Lunes, Miercoles y Sábado",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18)),
                          ),
                          ListTile(
                            title: Text(
                                "19:30 - 22:30",
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
  return allMarkers;
}

class _Map_ScreenState extends State<Map_Screen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar( title: Text(
                    "Puntos de recolección",
                    style: TextStyle(color: Colors.white),
                  ),
                  elevation: 0.0,
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 16.0, 0.0),
                      child: IconButton(
                          icon: Icon(Icons.view_list, color: Colors.white),
                          onPressed: () {
                            //go to listview
                            print('mira la lista');
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(Basurero('', '', '', ''))));
                          }),
                    )
                  ],),
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(-2.112297, -79.902110), minZoom: 5.0),
            layers: [
          new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          new MarkerLayerOptions(markers: setMarkers())
        ]));
  }
}
