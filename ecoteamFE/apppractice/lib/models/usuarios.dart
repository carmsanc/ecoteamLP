

class Usuarios {
  final int idUsuario;
  final String username;
  final String correo;
  final String contrasena;

  Usuarios({this.idUsuario, this.username, this.correo, this.contrasena});

  factory Usuarios.fromJson(Map<String, dynamic> json) {
    return Usuarios(
      idUsuario: json['idUsuario'],
      username: json['username'],
      correo: json['correo'],
      contrasena: json['contrasena'],
    );
  }
}