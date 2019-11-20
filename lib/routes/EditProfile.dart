import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:examen_flutter/widgets/raisedgradbutton.dart';
import 'package:examen_flutter/routes/Perfil.dart';


class EditProfile extends StatelessWidget {
  static const String routeName = '/routes/EditProfile';
  final username = TextEditingController();
  final password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    final namefield = TextField(
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "New username",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              controller: username,
        );
    final emailField = TextField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "New email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          
        );
    final nameField = TextField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "New full name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          
        );
        final savebutton = RaisedGradientButton(
          gradient: LinearGradient(
            colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
          ),
          onPressed: () {
            //guardar name e email
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Perfil()));
            },
          child: Text("Save",
            textAlign: TextAlign.center,
            style: style.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold)
          ),          
        );
    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('Edit Profile'),
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
                  builder: (BuildContext context) => Wrapper()));
              },
            ),
          ],
      ),
        drawer: AppDrawer(),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 45.0),
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
              SizedBox(height: 45.0),
              namefield,
              SizedBox(height: 25.0),
              emailField,
              SizedBox(height: 25.0),
              nameField,
              SizedBox(height: 35.0,),
              savebutton
            ],
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