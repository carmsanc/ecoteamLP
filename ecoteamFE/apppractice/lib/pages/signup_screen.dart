import 'package:apppractice/pages/inicio_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'login_screen.dart';
//import '../services/auth_service.dart';

class Signup_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: selectHomeScreen(),
    );
  }
}

Widget selectHomeScreen() {
  return StreamBuilder(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context, AsyncSnapshot snap) {
      if (snap.connectionState == ConnectionState.waiting) {
        return Text("Loading");
      } else {
        if (snap.hasData) {
          FirebaseUser user = snap.data;
          return StreamProvider<FirebaseUser>.value(
              initialData: user,
              value: FirebaseAuth.instance.onAuthStateChanged,
              child: Home_Screen());
        } else {
          return Signup_Page();
        }
      }
    },
  );
}

class Signup_Page extends StatefulWidget {
  @override
  _Signup_PageState createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  final _formKey = GlobalKey<FormState>();
  String username, _email, pwd, sector;

  Future _submit() async {
if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(pwd);
      print(username);
      print(sector);    
      FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _email, password: pwd)
        .then((currentUser) => Firestore.instance
                .collection("usuarios")
                .document(currentUser.user.uid)
                .setData({
              "username": username,
              "correo": _email,
              "sector": sector
            }).then((result) => {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home_Screen()),
                          (_) => false),
                    }));
  }}

  Future signup() async {
    await _submit();
    debugPrint("USERNAME :$_email Password $pwd");
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: pwd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Registro de Usuario',
                style: TextStyle(fontFamily: 'Billabong', fontSize: 30.0),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Username'),
                        validator: (input) => input.trim().isEmpty
                            ? 'Por favor ingrese un username válido'
                            : null,
                        onSaved: (input) => username = input,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (input) => !input.contains('@')
                            ? 'Por favor ingrese un email válido'
                            : null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (input) => input.length < 6
                            ? 'Por favor ingrese una contraseña'
                            : null,
                        onSaved: (input) => pwd = input,
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Sector'),
                        onSaved: (input) => sector = input,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 250.0,
                      child: FlatButton(
                        onPressed: (){_submit();
                        final snackBar = SnackBar(
                      content: Text('Registro exitoso'));
                      },
                        color: Colors.lightGreen,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0)),
                        child: Text(
                          'Registrar',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                    Container(
                      width: 250.0,
                      child: FlatButton(
                        onPressed: () => Navigator.push(context,MaterialPageRoute(
                              builder: (context) => Login_Screen() )),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0)),
                        color: Colors.black,
                        child: Text(
                          'Regresar',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

/* void _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(pwd);
      print(username);
      print(sector);
      
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: pwd)
          .then((currentUser) => Firestore.instance
                  .collection("usuarios")
                  .document(currentUser.user.uid)
                  .setData({
                "username": username,
                "correo": _email,
                "sector": sector,
                "password": pwd
              }).then((result) => {
                        StreamProvider<FirebaseUser>.value(
                            initialData: currentUser.user,
                            value: FirebaseAuth.instance.onAuthStateChanged,
                            child: Inicio_Screen())
                      }));
      //AuthService.signupUser(context, name, email, password,sector);
    }
 */
}
