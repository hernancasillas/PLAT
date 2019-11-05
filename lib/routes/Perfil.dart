import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  static const String routeName = '/routes/Perfil';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Perfil"),
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
        drawer: AppDrawer(),
        body:Center(
           child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: Icon(Icons.person, size: 100)
                    ),
                    SizedBox(height: 50.0),
                    Text('Hernan Casillas', style:TextStyle(fontSize: 25)),
                    SizedBox(height: 20.0),
                    Text('h.casillas@danthop.com', style:TextStyle(fontSize: 25)),
                    SizedBox(height: 20.0,),
                    Text('481-391-9369', style:TextStyle(fontSize: 25)),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            )
        )
    );
  }
}