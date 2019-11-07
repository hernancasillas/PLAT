import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/widgets/raisedgradbutton.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Confirmacion extends StatelessWidget {
  static const String routeName = '/routes/Vendedores';

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    final goBackButton = RaisedGradientButton(
      gradient: LinearGradient(
          colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
        ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => MainScreen()));
        },
      child: Text("Volver a comprar",
        textAlign: TextAlign.center,
        style: style.copyWith(
           color: Colors.white, fontWeight: FontWeight.bold)),
                    
        );
  
    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('Checkout'),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              SizedBox(height: 150, width: 150, 
                child: Image.asset('assets/check.png', fit: BoxFit.contain,),
              ),
              Text(
                  'Orden confirmada!',
                  style: style.copyWith(
                                    color: Colors.black, fontWeight: FontWeight.bold,
                                    fontSize: 30
                        ),
              ),
              SizedBox(height: 50,),
              goBackButton,

            ],
          )
        ),
        backgroundColor: Colors.white,
      );
  }
}