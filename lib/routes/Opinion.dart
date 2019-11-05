import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Opinion extends StatelessWidget {
  static const String routeName = '/routes/Vendedores';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('Producto'),
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
        body: 
          Center(
            child: Column(children: <Widget>[
              SizedBox(height: 30,),
              FlutterRatingBar(
                initialRating: 5,
                fillColor: Colors.amber,
                borderColor: Colors.amber.withAlpha(50),
                allowHalfRating: true,
                onRatingUpdate: (rating) {
                    print(rating);
                },
              ),
              SizedBox(height: 30,),
              Text('Excelente producto, llegó muy rápido!', style: TextStyle(fontSize: 22), textAlign: TextAlign.center,),
              SizedBox(height: 30,),
              Text('Mis respetos para el vendedor, muy cumplido!', style: TextStyle(fontSize: 22), textAlign: TextAlign.center,),
              SizedBox(height: 30,),
              Text('No podría estar más satisfecho, me quedaron de lujo!!', style: TextStyle(fontSize: 22), textAlign: TextAlign.center,),
            ],
          ),
      )
    );
  }
}