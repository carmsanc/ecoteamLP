import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:apppractice/models/usuarios.dart';

class Inicio_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fnController = TextEditingController();
    var fnBio = TextEditingController();
    var fnCorreo = TextEditingController();

    FirebaseUser user = Provider.of<FirebaseUser>(context);

    return StreamProvider<DocumentSnapshot>.value(
        value: Firestore.instance
            .collection("usuarios")
            .document(user.uid)
            .snapshots(),
        child: Builder(builder: (context) {
          DocumentSnapshot snapshot = Provider.of<DocumentSnapshot>(context);
          if (snapshot != null && snapshot.exists) {
            var data = snapshot.data;

            return ChangeNotifierProvider<Usuarios>(
              create: (context) => Usuarios.getInstance(
                  data["username"], data["correo"], data["sector"]),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  title: Text(
                    "Perfil de usuario",
                    style: TextStyle(color: Colors.white),
                  ),
                  elevation: 0.0,
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 16.0, 0.0),
                      child: IconButton(
                          icon: Icon(Icons.exit_to_app, color: Colors.white),
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                          }),
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.bottomRight,
                      heightFactor: 0.25,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(
                              MediaQuery.of(context).size.width)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Consumer<Usuarios>(
                          builder: (context, pData, _) {
                            fnController.value =
                                TextEditingValue(text:pData.username);
                            fnBio.value = TextEditingValue(text:pData.sector);
                            fnCorreo.value = TextEditingValue(text:pData.correo);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 50, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://cdn4.iconfinder.com/data/icons/flatastic-3/256/user-512.png"))),
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextField( 
                                      
                                      onChanged: (text) {
                                        pData.username = text.trim();
                                      },

                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue.shade900),
                                      controller: fnController,
                                      decoration: InputDecoration(
                                          hintText: "UserName", 
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.6)),
                                              borderSide: BorderSide(
                                                  color: Colors.white)))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextField(
                                      controller: fnBio,
                                      onChanged: (text) {
                                        pData.sector = text.trim();
                                      },
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue.shade900),
                                      decoration: InputDecoration(
                                          hintText: "Sector",
                                          hintMaxLines: 1,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.6)),
                                              borderSide: BorderSide(
                                                  color: Colors.green)))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextField(
                                      controller: fnCorreo,
                                      onChanged: (text) {
                                        pData.correo = text.trim();
                                      },
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue.shade900),
                                      decoration: InputDecoration(
                                          hintText: "Correo",
                                          hintMaxLines: 1,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.6)),
                                              borderSide: BorderSide(
                                                  color: Colors.green)))),
                                ),
                                MaterialButton(
                                  color: Colors.blue[300],
                                  onPressed: () {
                                    snapshot.reference
                                        .updateData(pData.toMap());
                                  },
                                  child: Text(
                                    "Guardar cambios",
                                    style: TextStyle(color: Colors.white, fontSize: 14),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }
}
