import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Confirmacion extends StatelessWidget {
  static const String routeName = '/routes/Vendedores';

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    final goBackButton = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen()));
              },
            child: Text("Volver a comprar",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
                    
          ),
        );
  
    return new Scaffold(
        appBar: AppBar(
          title: Text("Confirmacion"),
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