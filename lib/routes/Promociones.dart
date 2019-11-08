import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Promociones extends StatelessWidget {
  static const String routeName = '/routes/Promociones';

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
        appBar: AppBar(
          title: Text("Promociones"),
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
          child: Column(children: <Widget>[
            row1,
            SizedBox(height: 10,),
            row2
          ],)
        )
    );
  }
}
var style = new TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red);
var style2 = new TextStyle(fontSize: 20);
var row1 = new Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 150,
          width: 150,
          child: 
            Card(
              child: Text('\n23% de descuento \n\n Codigo: HC23', style: style, textAlign: TextAlign.center),
            )
        ,)
      ),
    ),
    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 150,
          width: 150,
          child: 
            Card(
              child: Text('\n50% de descuento \n\n Codigo: MO50', style: style, textAlign: TextAlign.center),
            )
        ,)
      ),
    ),
  ],
);

var row2 = new Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 150,
          width: 150,
          child: 
            Card(
              child: Text('\n11% de descuento \n\n Codigo: HM11', style: style, textAlign: TextAlign.center),
            )
        ,)
      ),
    ),
    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 150,
          width: 150,
          child: 
            Card(
              child: Text('\n22% de descuento \n\n Codigo: MH22', style: style, textAlign: TextAlign.center),
            )
        ,)
      ),
    ),
  ],
);