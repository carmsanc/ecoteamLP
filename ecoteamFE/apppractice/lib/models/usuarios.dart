import 'package:flutter/foundation.dart';

class Usuarios with ChangeNotifier{

  String username,correo,sector;

  Usuarios();

  Usuarios.getInstance(this.username,this.correo,this.sector);

  String get getUsername => username;

  String get getCorreo => correo;

  String get getSector => sector;

  set setusername(String un){
    username = un;
    notifyListeners();
  }

  set setcorreo(String correo){
    correo = correo;
    notifyListeners();
  }

  set setBio(String sector){
    this.sector = sector;
    notifyListeners();
  }

  Map<String,dynamic> toMap(){
    var data = {
      'username':username,
      'correo':correo,
      'sector':sector
    };
    return data;
  }

}