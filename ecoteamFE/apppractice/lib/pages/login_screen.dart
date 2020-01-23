import 'package:apppractice/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'package:apppractice/pages/custom-clip.dart';
import 'package:apppractice/pages/design.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_Screen extends StatefulWidget {
  static final String id = 'login_screen';

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}


class _Login_ScreenState extends State<Login_Screen> {
  
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  /* _submit() {
    if (_formKey.currentState.validate()) {
      
      _formKey.currentState.save();
      print(_email);     //cambiar email
      print(_password);
    }
    //AuthService.login(context, email, password);
  } */

  @override
  Widget build(BuildContext context) {
      Design mStyle = new Design(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              //child: ClipPath(
                  child: Container(
                    height: mStyle.getheigth(val: 30),
                    //color: Colors.white,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fitHeight,
                      filterQuality: FilterQuality.low,
                      height: mStyle.getheigth(val: 50),
                      width: mStyle.getwidth(),
                    ),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                  ),
                  //clipper: CustomClip(),

              //  )
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Email: '),
                      onSaved: (input) => _email = input, //cambiar email
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Contraseña'),
                      validator: (input) => input.length <= 1
                          ? 'Porfavor ingrese contraseña correcta'
                          : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                      onPressed: signIn,
                      color: Colors.lightGreen,
                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0)
                                        ),
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Signup_Screen.id),
                      color: Colors.black87,
                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0)
                                        ),
                      child: Text(
                        'Regístrate',
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
    );
  }

Future<void> signIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        final AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email,password: _password);
        FirebaseUser auth_user= result.user;       
        print(result);

        //navigate home
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_Screen(user:auth_user)));
      }catch(e){
        print(e.message);
      }

    }
  }
}
