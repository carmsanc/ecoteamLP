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

List<Marker> allMarkers=[];
  setMarkers(){
    allMarkers.add(
        new Marker(
            width: 45.0,
            height: 45.0,
            point: new LatLng(-2.146337, -79.963309),
            builder: (context) => new Container(
              child: IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.blue,
                iconSize: 45.0,
                onPressed: () {
                  print('Marker first ');
                },
              ),
            ))
    );
    allMarkers.add(
        new Marker(
            width: 45.0,
            height: 45.0,
            point: new LatLng(-2.145791, -79.965197),
            builder: (context) => new Container(
              child: IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.green,
                iconSize: 45.0,
                onPressed: () {
                  print('Marker two');
                },
              ),
            ))
    );
    allMarkers.add(
        new Marker(
            width: 45.0,
            height: 45.0,
            point: new LatLng(-2.146337, -79.963309),
            builder: (context) => new Container(
              child: IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45.0,
                onPressed: () {
                  print('Marker three');
                },
              ),
            ))
    );
    return allMarkers;

  }

class _Map_ScreenState extends State<Map_Screen> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(-2.146337, -79.963309), minZoom: 5.0),
            layers: [
              new TileLayerOptions(
                    
                  urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']
                  ),
              new MarkerLayerOptions(
                markers: setMarkers()
              )
            ]));
  }
}

