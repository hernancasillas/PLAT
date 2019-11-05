// home_material.dart
import 'package:examen_flutter/routes/Confirmacion.dart';
import 'package:flutter/material.dart';
import './user.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:examen_flutter/main.dart';


class Checkout extends StatefulWidget {
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}
class _HomeMaterialState extends State {
  final _formKey = GlobalKey();
  final _user = User();
  
  @override
  Widget build(BuildContext context) {
      TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final pagarButton = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Confirmacion()));
              },
            child: Text("Pagar",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
                    
          ),
        );
    return Scaffold(
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
        body: ListView(
            children: <Widget>[
              Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset('assets/credit.png'),

                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'No. de Tarjeta'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Numero de tarjeta';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _user.firstName = val),
                          ),
                          Container(child:
                            creditCardRow
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: pagarButton
                          ),
                        ]
                      )
                  )
                )
              )
            ],
        )
            );
  }

  var creditCardRow = new Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
            decoration:
              InputDecoration(labelText: 'Mes'),
        ),
      ),
    ),
    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
            decoration:
              InputDecoration(labelText: 'Año'),
              )
      ),
    ),
    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
            decoration:
              InputDecoration(labelText: 'CVV'),
              )
      ),
    ),
  ],
);


}