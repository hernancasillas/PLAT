
import 'package:examen_flutter/routes/Perfil.dart';
import 'package:examen_flutter/routes/Plantilla.dart';
import 'package:examen_flutter/routes/FAQ.dart';
import 'package:examen_flutter/routes/GoPremium.dart';
import 'package:examen_flutter/routes/about.dart';
import 'package:examen_flutter/routes/PrivacyAgreement.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF064B71), const Color(0xFF2692C2)],
              ),
          ),
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(context),
          _createDrawerItem(icon: Icons.account_circle,text: 'Following', 
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Perfil()));
            },),
          _createDrawerItem(icon: Icons.settings, text: 'Settings', 
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Plantilla()));
            },
          ),
          Divider(),
          _createDrawerItem(icon: Icons.info_outline, text: 'About Us',
            onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => About()));
              },
            ),
          _createDrawerItem(icon: Icons.question_answer, text: 'FAQ', 
            onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => FAQ()));
              },
            ),
            _createDrawerItem(icon: Icons.lock_open, text: 'Go Premium',
            onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => GoPremium()));
              },
            ),
            _createDrawerItem(icon: Icons.perm_device_information , text: 'Privacy Agreement',
            onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PrivacyAgreement()));
              },
            ),
            SizedBox(height: 100,),
          ListTile(
            title: Text('Hernan Casillas 1.0', style: TextStyle(fontSize: 15, color: Colors.white)),
            onTap: () {},
          ),
        ],
        ),
        )
    );
  }
    
}

Widget _createHeader(BuildContext context) {
        return  
        Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50,),
                  GestureDetector(child: 
                    SizedBox(
                      height: 155.0,
                       child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                       
                    ),
                    onTap:() {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Perfil()));
                            },
                  ),
                  SizedBox(height: 20,),
                  Text('Username', style: TextStyle(fontSize: 20, color: Colors.white)),
                  SizedBox(height: 20,)
                ], 
            ),
          );
        
              
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon, size: 30, color: Colors.white,),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white),),
        )
      ],
    ),
    onTap: onTap,
  );
}