import 'dart:async';
import 'dart:convert';

import 'package:apppractice/pages/custom-clip.dart';
import 'package:apppractice/pages/design.dart';
import 'package:apppractice/pages/powerPage.dart';
import 'package:apppractice/pages/vendedoresPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(LoginApp());

String username;

class LoginApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter and Mysql",
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/powerPage': (BuildContext context) => new Power(),
        '/vendedoresPage': (BuildContext context) => new Vendedores(),
        '/LoginPage': (BuildContext context)=> LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  
  String mensaje='';

  Future<List> login() async{
    final response= await http.post(
      "http://192.168.101.44/tienda/login.php", 
      body: {
        "username": controllerUser.text,
        "password": controllerPassword.text,
      });
    
    var datauser = json.decode(response.body);

    if( datauser.length == 0){
      setState(() {
        mensaje="usuario o contraseña incorrectas";
      });
    } else{
      Navigator.pushReplacementNamed(context, '/powerPage');
      setState(() {
        username=datauser[0]['username'];
      });
    }
    return datauser;
  }
  



  @override
  Widget build(BuildContext context) {
    Design mStyle = new Design(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.lightGreen,
        height: mStyle.getheigth(),
        child: ListView(
          children: <Widget>[
            Container(
                color: Colors.white, //cambiar
                
                child: ClipPath(
                  child: Container(
                    height: mStyle.getheigth(val: 35),
                    color: Colors.lightGreen[100],
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fitHeight,
                      filterQuality: FilterQuality.low,
                      height: mStyle.getheigth(val: 50),
                      width: mStyle.getwidth(),
                    ),
                    padding: const EdgeInsets.all(30),
                    alignment: Alignment.center,
                  ),
                  clipper: CustomClip(),

                ),
              ),
              Container(
                color: Colors.white,
                height: mStyle.getheigth(val: 70),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "\nBienvenido a ECO TEAM!",
                      style: TextStyle(
                          fontSize: 20, color: Colors.grey[700]),
                    ),
                    SizedBox(
                      height: mStyle.getheigth(val: 5),
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[200],
                                  blurRadius: 5,
                                  offset: Offset(5, 10))
                            ]),
                        child: Form(
                          child: Container(
                            
                            child : Column(
                              children: <Widget>[
                                new Container(
                                  height: MediaQuery.of(context).size.height /2.5,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(
                                    top: 10
                                  ),
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width: MediaQuery.of(context).size.width /1.2,
                                        height: 40,
                                        padding: EdgeInsets.only(
                                          top: 4, left: 16,right: 16,bottom: 4
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(50)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 10
                                            )
                                            
                                          ]
                                        ),
                                        child: TextFormField(
                                          controller: controllerUser,
                                          decoration: InputDecoration(
                                            icon: Icon(
                                              Icons.email,
                                              color: Colors.lightGreen, 
                                            ),
                                            hintText: 'Usuario'
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width /1.2,
                                        height: 40,
                                        margin: EdgeInsets.only(
                                          top: 32
                                        ),
                                        padding: EdgeInsets.only(
                                          top: 4, left: 16,right: 16,bottom: 4
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(50)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 10
                                            )
                                            
                                          ]
                                        ),
                                        child: TextFormField(
                                          controller: controllerPassword,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            icon: Icon(
                                              Icons.vpn_key,
                                              color: Colors.lightGreen, 
                                              
                                            ),
                                            hintText: 'Contraseña'
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      new RaisedButton(
                                        //padding: EdgeInsets.only(top: 4, left: 16,right: 16,bottom: 4),
                                        child: new Text("Iniciar sesión",style: TextStyle(fontSize: 17,color: Colors.white)),
                                        color: Colors.lightGreen,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0)
                                        ),
                                        onPressed: (){
                                          login();
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Text(mensaje,
                                      style: TextStyle(fontSize: 25,color: Colors.red))
                                    ],
                                  ),
                                )
                              ],
                            )
                            ,)
                        )),
                  ],
                ),
              )

          ]
        ),
      )
    );
  }
}