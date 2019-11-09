import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ViewRecipe extends StatelessWidget {
  static const String routeName = '/routes/ViewRecipe';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('View Recipe'),
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
        body: Center(
          child:Column(
            children:<Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[
                  Container(
                    child :
                      Text("last eaten: March 5th, 2019"),
                    
                  ),
                  Container(
                    child:
                    SizedBox(
                      height: 100,
                      child:  Image.asset(
                        "assets/crepa.png",
                      ),
                    ) 
                     
                  ),
                ]
              ),
            ],
          ),
          )
      );
  }
}