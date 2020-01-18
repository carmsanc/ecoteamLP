import 'package:flutter/material.dart';
import 'manejo.dart';
import 'image_card.dart';

class ImageCards extends StatefulWidget {
  @override
  _ImageCardsState createState() => _ImageCardsState();
}

class _ImageCardsState extends State<ImageCards> {
  List<Manejo> places = [
    Manejo(titulo: 'Envases', icono: 'ima1.png',  colori: Colors.amberAccent),
    Manejo(titulo: 'Papel', icono: 'ima2.png', colori: Colors.blueAccent),
    Manejo(titulo: 'Vidrio', icono: 'ima3.png',  colori: Colors.greenAccent),
    Manejo(titulo: 'Orgánico', icono: 'ima4.png',  colori: Colors.orangeAccent),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: places.length,
            itemBuilder: (_, index) {
              return ImageCard(
                manejo: places[index],
                titulo: places[index].titulo,
                picture: places[index].icono,
                colori: places[index].colori,
              );
            }));
  }
}
