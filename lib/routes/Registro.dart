import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/widgets/raisedgradbutton.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

final nombre = TextEditingController();
final edad = TextEditingController();
final email = TextEditingController();
final celular = TextEditingController();
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
class Registro extends StatelessWidget {
  static const String routeName = '/routes/Perfil';
  
  @override
  Widget build(BuildContext context) {
    
    
    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('Welcome!'),
        gradient: /* LinearGradient(colors: [Colors.blue, Colors.purple, Colors.red]) */
                  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF064B71), const Color(0xFF2692C2)],
              ),
              actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen()));
              },
            ),
          ],
      ),
        
        body: SnackBarPage(),
        );
  }
}



class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              controller: email,
        );
    final nombreField = TextField(
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              controller: nombre,
        );
    final celularField = TextField(
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              controller: celular,
        );
      
      final registerButton = RaisedGradientButton(
            gradient: LinearGradient(
            colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
          ),
            onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen()));
            },
            child: Text("Sign Up",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
                    
          
        );
    return Center(
           child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: IconButton(
                        padding: new EdgeInsets.all(0.0),
                        color: Colors.grey,
                        icon: Icon(Icons.photo_camera, size:50.0),
                        onPressed: () => {
                          snackBar2,
                            Scaffold.of(context).showSnackBar(snackBar2)
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: IconButton(
                        padding: new EdgeInsets.all(0.0),
                        color: Colors.grey,
                        icon: Icon(Icons.photo_library, size:50.0),
                        onPressed: () => {
                            snackBar1,
                            Scaffold.of(context).showSnackBar(snackBar1)
                        },
                      ),
                    ),
                    
                    
                    SizedBox(height: 50.0),
                    emailField,
                    SizedBox(height: 20.0),
                    nombreField,
                    SizedBox(
                      height: 20.0,
                    ),
                    celularField,
                    SizedBox(height: 20.0),
                    registerButton,
                  ],
                ),
              ),
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