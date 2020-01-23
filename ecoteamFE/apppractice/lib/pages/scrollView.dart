import 'package:flutter/material.dart';
import 'manejo.dart';
import 'image_card.dart';

class ImageCards extends StatefulWidget {
  @override
  _ImageCardsState createState() => _ImageCardsState();
}

class _ImageCardsState extends State<ImageCards> {
  List<Manejo> places = [
    Manejo(titulo: 'Envases', icono: 'ima1.png',  colori: Colors.amberAccent, tacho: 'tacho1.PNG',
     donde: 'En el contenedor amarillo van los envases. Envases de plástico, tetrabriks y latas.Envases de plástico (botellas de plástico, bolsas de plástico, envases de plástico), latas de bebidas y latas de conservas, papel de aluminio, film transparente, etc',
     como: 'El plástico se puede reciclar de manera química o mecánica. La primera es más compleja y costosa, por lo que usualmente se recicla con la segunda técnica. El reciclaje mecánico lleva una primera instancia de trituración del material para conseguir chips.'),
    Manejo(titulo: 'Papel', icono: 'ima2.png', colori: Colors.blueAccent, tacho: 'tacho2.PNG',
    donde: 'En el contenedor azul va el papel y el cartón. Lo recogido también va a las plantas de reciclaje respectivas, allí se tritura y compacta y se transforma en unas grandes balas de papel. Estas balas luego se hidratan para crear pasta de papel que pasa por un proceso de limpieza.',
    como: 'El papel se logra a partir de procesos químicos que tratan la pulpa de celulosa, obtenida previamente de los árboles. Es un material sensible y reciclable, aunque solo permite pasar cuatro veces por ese proceso. Sin embargo, al reciclar papel, en vez de producirlo a partir de la materia prima, se puede reducir hasta un 60% el consumo de agua y hasta un 40% de consumo de energía'),
    Manejo(titulo: 'Vidrio', icono: 'ima3.png',  colori: Colors.greenAccent, tacho: 'tacho3.PNG',
    donde: 'En el contenedor verde van los envases de vidrio. El vidrio recolectado se lleva a la planta de reciclaje, se limpia, se retira todo lo que no es vidrio (etiquetas, pegamento, etc) y se tritura hasta convertirlo en polvo. Esto sirve de materia prima para fabricar envases de vidrio como los originales',
    como: 'Al reciclar vidrio se impacta de manera positiva en el medio ambiente, dado que permite conservar aquellos recursos naturales que se utilizan en su fabricación inicial. El proceso de reciclaje en comparación al de fabricación trae numerosos beneficios: se consume menos agua, se reduce considerablemente el consumo de energía, se reducen los residuos generados por el proceso, y las emisiones de gases disminuyen.'),
    Manejo(titulo: 'Orgánico', icono: 'ima4.png',  colori: Colors.orangeAccent, tacho: 'tacho4.PNG',
    donde: 'En el contenedor marrón van los residuos orgánicos. Básicamente todo lo que si lo dejaras en una bolsa después de días se pudriría. Residuos de materia orgánica, de origen vegetal y/o animal. Restos de comida o de jardinería. Normalmente se llevan a parques donde se convierten en compost que se usa como abono orgánico principalmente.',
    como: 'El Reciclaje orgánico o de materia orgánica, es aquel en el que la materia a reciclar, proviende de desechos naturales como son los alimentos, hojas, seres vivos o excrementos. Estos restos tienen un proceso natural de descomposición, por lo que rápidamente desaparecen para formar parte de nuevo del ciclo de la vida'),
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
