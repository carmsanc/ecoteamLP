class Basurero{
  String nombre;
  String detalle;
  String dia;
  String hora;

  Basurero(this.nombre,this.detalle,this.dia,this.hora);

  Basurero.map(dynamic obj){
    this.nombre = obj['nombre'];
    this.detalle = obj['detalle'];
    this.dia = obj['dia'];
    this.hora = obj['hora'];
  }

  String get bnombre => nombre;
  String get bdetalle => detalle;
  String get bdia => dia;
  String get bhora => hora;

  Map<String,dynamic> toMap(){
    var map=new Map<String,dynamic>();
    map['nombre']=nombre;
     map['detalle'] = detalle;
    map['dia'] = dia;
    map['hora'] = hora;
    return map;
  }

  Basurero.fromMap(Map<String,dynamic> map){
    this.nombre= map['nombre'];
    this.detalle = map['detalle'];
    this.dia = map['dia'];
    this.hora = map['hora'];
    
  }
}