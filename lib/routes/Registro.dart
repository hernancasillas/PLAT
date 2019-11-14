import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/services/auth.dart';
import 'package:examen_flutter/widgets/raisedgradbutton.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

final nombre = TextEditingController();
final edad = TextEditingController();
final email = TextEditingController();
final celular = TextEditingController();
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  static const String routeName = '/routes/Perfil';

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String passwd = '';
  String username = '';
  String error = '';
  

  @override
  Widget build(BuildContext context) {
    
    final emailField = TextFormField(
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
            validator: (val) => val.isEmpty ? 'Enter your email!' : null,
            onChanged: (val) {
              setState(() => email = val);
            },    
        );
    final nombreField = TextFormField(
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Username",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          
          onChanged: (val) {
              setState(() => username = val);
          },   
        );
    final passwordField = TextFormField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          validator: (val) => val.length < 6 ? '6 or more characters, please!' : null,
          onChanged: (val) {
              setState(() => passwd = val);
          },
        );
      
      final registerButton = RaisedGradientButton(
            gradient: LinearGradient(
            colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
          ),
            onPressed: () async {
              if(_formKey.currentState.validate())
              {
                dynamic result = await _auth.registerWithEmailAndPassword(email, passwd);
                if(result == null){
                  setState(() => error = 'Please supply a valid email');
                }
              }
            },
            child: Text("Sign Up",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
                    
          
        );
    
    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('Sign up to PLAT'),
        gradient: /* LinearGradient(colors: [Colors.blue, Colors.purple, Colors.red]) */
                  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF064B71), const Color(0xFF2692C2)],
              ),
        actions: <Widget>[
            // action button
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text('Sign In', style: TextStyle(color: Colors.white)),
              onPressed: () {
                widget.toggleView();
            },
          ),
        ],
      ),
        
        body: ListView(
                  children: <Widget>[
            Form(
            key: _formKey,
            child: Center(
               child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 155.0,
                          child: Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.contain,
                          ), 
                        ),
                        SizedBox(height: 50.0),
                        emailField,
                        SizedBox(height: 20.0),
                        nombreField,
                        SizedBox(
                          height: 20.0,
                        ),
                        passwordField,
                        SizedBox(height: 20.0),
                        registerButton,
                        SizedBox(height: 15.0),
                        Text(error, style: TextStyle(color: Colors.red, fontSize: 14),)
                      ],
                    ),
                  ),
                )
              ),
            ),
                  ], 
        )
        );
  }
}

final snackBar1 = SnackBar(
  content: Text('Abre la galería'),
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);

final snackBar2 = SnackBar(
  content: Text('Abre la cámara'),
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);