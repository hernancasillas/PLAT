import 'package:cloud_firestore/cloud_firestore.dart';
/* import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/models/myUser.dart';
import 'package:examen_flutter/services/database.dart';
import 'package:examen_flutter/user_list.dart'; */
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/widgets/loading.dart';
import 'package:examen_flutter/widgets/raisedgradbutton.dart';
import 'package:examen_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:examen_flutter/routes/EditProfile.dart';
/* import 'package:provider/provider.dart'; */

class Perfil extends StatelessWidget {
  static const String routeName = '/routes/Perfil';
  final user;
  

  Perfil({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final col = Firestore.instance.collection("user").document(user.uid).collection("name");
    
    return Scaffold(
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
                                builder: (BuildContext context) => Wrapper()));
                },
              ),
            ],
        ),
          drawer: AppDrawer(user: user,),
          body: 
          
          StreamBuilder(
            stream: Firestore.instance.collection('user').document(user.uid).snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData)
              {
                return Loading();
              }
              var userDocument = snapshot.data;
              
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
                            height: 100.0,
                            width: 100.0,
                            child: Icon(Icons.person, size: 100)
                          ),
                          SizedBox(height: 50.0),
                          Text(userDocument['name'], style:TextStyle(fontSize: 25)),
                          SizedBox(height: 20.0),
                          Text(userDocument['email'], style:TextStyle(fontSize: 25)),
                          SizedBox(height: 20.0,),
                          Text(userDocument['username'], style:TextStyle(fontSize: 25)),
                          SizedBox(height: 20.0),
                          RaisedGradientButton(
                           
                            gradient: LinearGradient(
                              colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
                            ),
                            onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => EditProfile(user: user, name: userDocument['name'], email: userDocument['email'], usuario: userDocument['username'],)));
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
              );
            }
          ) 
      
    );
  }

  
}