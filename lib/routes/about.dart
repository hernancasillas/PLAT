
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class About extends StatelessWidget {
  static const String routeName = '/routes/about';
  final user;

  About({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('About Us'),
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
        drawer: AppDrawer(user: user),
        body: Center(
          child: ListView(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(30,30,30,0),
              child: Text("We are PLAT, a team of developers from the UASLP. \n\nThis app was made with the intention of helping you out when you run out of ideas for your menu or you're simply too tired to think about it. \nWe hope you enjoy this app.", style: TextStyle(fontSize: 20)),
              ),
              Padding(padding:const EdgeInsets.all(1),
              child:
              Image.asset("assets/logofac.jpg"))
            ],
          ),
        )
          
      );
  }
}