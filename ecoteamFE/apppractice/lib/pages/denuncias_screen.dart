import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Denuncias_Screen extends StatefulWidget {
  var userData;
  Denuncias_Screen(this.userData);

  static final String id = 'denuncias_screen';
  @override
  _Denuncias_ScreenState createState() => _Denuncias_ScreenState();
}

class _Denuncias_ScreenState extends State<Denuncias_Screen> {
  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = Item("", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase
        .instance; //Rather then just writing FirebaseDatabase(), get the instance.
    itemRef = database.reference().child('items');
    itemRef.onChildAdded.listen(_onEntryAdded);
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
    });
  }

  void handleSubmit() {
    final FormState form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(item.toJson());
      print("se envio denuncia");
    }
  }

  String descripcion;
  String _selectedSector;
  String _selectedMotivo;
  List<String> _sector = [
    'Sauces',
    'Alborada',
    'Samanes',
    'Guayacanes',
    'Samborondon',
    'Prosperina'
  ];
  List<String> _motivo = [
    'Mala Higiene',
    'Horario incumplido',
    'Deposición de basura fuera de horario',
    'Otro'
  ];
  String _dropdownSector;
  String _dropdownMotivo;
  File _image;

  validateUser() async {
    final denunciaForm = _formKey.currentState;
    if (_selectedSector == null) {
      setState(() => _dropdownSector = "Seleccione un sector");
      return false;
    }
    if (_selectedMotivo == null) {
      setState(() => _dropdownMotivo = "Seleccione un motivo");
      return false;
    }

    if (denunciaForm.validate()) {
      _formKey.currentState.save();
      if (descripcion.isEmpty) {
        descripcion = 'null';
      }

      final data = {
        'sector': _selectedSector,
        'motivo': _selectedMotivo,
        'descripcion': descripcion
      };
      print(data);
    }
  }

  Widget _buildHeader() {
    return SizedBox(
      width: 195.0,
      height: 180.0,
      child: (_image != null)
          ? Image.file(
              _image,
              fit: BoxFit.fill,
            )
          : Image.network(
              "https://cdn1.iconfinder.com/data/icons/business-finance-vol-1/48/10_feedback_chat_comment_discussion_message_complaint_bubble-512.png",
              fit: BoxFit.fill,
            ),
    );
  }

  Widget _buildSector() {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        isExpanded: true,
        value: _selectedSector,
        hint: Text('Seleccione un sector',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            )),
        style: TextStyle(fontSize: 16, color: Colors.grey),
        onChanged: (newValue) {
          setState(() {
            _selectedSector = newValue;
            _dropdownSector = null;
            item.sector = _selectedSector;
          });
        },
        items: _sector.map((sector) {
          return DropdownMenuItem(
            child: new Text(
              sector,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: sector,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMotivo() {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        isExpanded: true,
        value: _selectedMotivo,
        hint: Text('Seleccione un motivo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            )),
        style: TextStyle(fontSize: 16, color: Colors.grey),
        onChanged: (newValue) {
          setState(() {
            _selectedMotivo = newValue;
            _dropdownMotivo = null;
            item.motivo = _selectedMotivo;
          });
        },
        items: _motivo.map((motivo) {
          return DropdownMenuItem(
            child: new Text(
              motivo,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: motivo,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDescr() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Descripción'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Ingrese una descripcion';
        }
      },
      onSaved: (String value) {
        item.descripcion = value;
      },
    );
  }

  Widget _buildFoto() {
    return RaisedButton(
      color: Colors.blue[300],
      onPressed: () {
        getImage();
      },
      child: Text(
        'Elegir Imagen',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Realizar denuncias'),
      ),
      body: Builder(
        builder: (context) => Container(
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: <Widget>[
                    _buildHeader(),
                    _buildSector(),
                    _buildMotivo(),
                    _buildDescr(),
                    SizedBox(height: 10),
                    _buildFoto(),
                    SizedBox(height: 10),
                    RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    item.imagen = basename(_image.path);
                    handleSubmit();

                    uploadPic(context);
                    final snackBar = SnackBar(
                      content: Text('Se ha enviado la denuncia'),
                    );

                    // Find the Scaffold in the widget tree and use
                    // it to show a SnackBar.
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  child: Text(
                    'Enviar',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  String sector;
  String motivo;
  String descripcion;
  String imagen;

  Item(this.sector, this.motivo, this.descripcion, this.imagen);

  Item.fromSnapshot(DataSnapshot snapshot)
      : sector = snapshot.value["sector"],
        motivo = snapshot.value["motivo"],
        descripcion = snapshot.value["descripcion"],
        imagen = snapshot.value["imagen"];

  toJson() {
    return {
      "sector": sector,
      "motivo": motivo,
      "descripcion": descripcion,
      "imagen": imagen
    };
  }
}
