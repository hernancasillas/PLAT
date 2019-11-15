import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/models/myUser.dart';
import 'package:examen_flutter/services/database.dart';
import 'package:examen_flutter/user_list.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/widgets/raisedgradbutton.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:examen_flutter/routes/EditProfile.dart';
import 'package:provider/provider.dart';

class Perfil extends StatelessWidget {
  static const String routeName = '/routes/Perfil';

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<myUser>>.value(
          value: DatabaseService().users,
          child: new Scaffold(
          appBar: GradientAppBar(
          title: Text('Perfil'),
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
          drawer: AppDrawer(),
          body: UserList(),
          
          /* Center(
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
                      RaisedGradientButton(
                       
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
                        ),
                        onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => EditProfile()));
                          },
                        child: Text("Edit Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)
                        ),          
                      ),
                    ],
                  ),
                ),
              )
          ) */
      ),
    );
  }
}