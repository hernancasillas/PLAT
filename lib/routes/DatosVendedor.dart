import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class DatosVendedor extends StatelessWidget {
  static const String routeName = '/routes/Vendedores';

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    return new Scaffold(
        appBar: AppBar(
          title: Text("Datos Vendedor"),
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
        body:Center(
           child: ListView(children: <Widget>[
             Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 50.0),
                    Text('Cristian Hemsworth', style:TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Text('Avenger Store', style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Text('4126 ventas en los últimos 4 meses', style:TextStyle(fontSize: 20)),
                    SizedBox(height: 20.0),
                    Container(
                      width: 300,
                      height: 200,
                      child: 
                          Card(                      
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/comments.png'),
                                    SizedBox(height: 20),
                                    Text('Brinda buena atención', style: style,),
                                ],)
                          ),
                    ),
                    Container(
                      width: 300,
                      height: 200,
                      child: Card(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/entregas.png'),
                              SizedBox(height: 20),
                              Text('Entrega a tiempo', style: style,),
                              
                          ],),
                    ),
                        
                        
                    ),
                    SizedBox(height: 20.0),
                    Text('c.hemsworth@avengers.com', style:TextStyle(fontSize: 20)),
                    SizedBox(height: 20.0,),
                    Text('481-391-9369', style:TextStyle(fontSize: 20)),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            )
           ],)
        )
    );
  }
}

var creditCardRow = new Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(),
      ),
    ),
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
  ],
);
