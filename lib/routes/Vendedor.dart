import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/routes/DatosVendedor.dart';
import 'package:examen_flutter/routes/Producto.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Vendedor extends StatelessWidget {
  static const String routeName = '/routes/Vendedores';

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    return new Scaffold(
        appBar: AppBar(
          title: Text("Vendedor"),
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
           child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: <Widget>[
                    SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: Image.asset('assets/chris.png', fit: BoxFit.contain,)
                    ),
                    SizedBox(height: 50.0),
                    GestureDetector(child: Text('Cristian Hemsworth', 
                      style: style.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30,decoration: TextDecoration.underline),  
                    ),
                      onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => DatosVendedor()));
                            },
                    ),
                    SizedBox(height: 15,),
                    GestureDetector(child: Text('Ver Datos', 
                      style: style.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15,decoration: TextDecoration.underline),  
                    ),
                      onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => DatosVendedor()));
                            },
                    ),
                    

                    SizedBox(height: 20.0),
                    Container(height: 250,
                      child: ListView(
                      children: <Widget>[
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.book, size: 50),
                            title: Text('Producto 1', style: style.copyWith(
                            color: Colors.black, fontWeight: FontWeight.normal, fontSize: 25),),
                            subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                            trailing: Icon(Icons.more_vert),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Producto1 (image: 'assets/sneakers.png')));
                            }
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.book, size: 50),
                            title: Text('Producto 2', style: TextStyle(fontSize: 25)),
                            subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.book, size: 50),
                            title: Text('Producto 3', style: TextStyle(fontSize: 25)),
                            subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ),
                      ],
                    ),
                    )
                    
                  ],
                ),
              ),
            )
        ),
        backgroundColor: Colors.white,
    );
  }
}