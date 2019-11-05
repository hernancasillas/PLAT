import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/routes/Producto.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Categorias extends StatelessWidget {
  static const String routeName = '/routes/EventsPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Categorías"),
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
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.style, size: 50),
                title: Text('Categoría 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('No. de productos: 15', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Producto1(image: 'assets/sneakers.png')));
                }
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.style, size: 50),
                title: Text('Categoría 2', style: TextStyle(fontSize: 30)),
                subtitle: Text('No. de productos: 10', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.style, size: 50),
                title: Text('Categoría 3', style: TextStyle(fontSize: 30)),
                subtitle: Text('No. de productos: 20', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.style, size: 50),
                title: Text('Categoría 4', style: TextStyle(fontSize: 30)),
                subtitle: Text('No. de productos: 8', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.style, size: 50),
                title: Text('Categoría 5', style: TextStyle(fontSize: 30)),
                subtitle: Text('No. de productos: 2', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.style, size: 50),
                title: Text('Categoría 6', style: TextStyle(fontSize: 30)),
                subtitle: Text('No. de productos: 4', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.style, size: 50),
                title: Text('Categoría 7', style: TextStyle(fontSize: 30)),
                subtitle: Text('No. de productos: 3', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.style, size: 50),
                title: Text('Categoría 8', style: TextStyle(fontSize: 30)),
                subtitle: Text('No. de productos: 5', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.style, size: 50),
                title: Text('Categoría 9', style: TextStyle(fontSize: 30)),
                subtitle: Text('No. de productos: 1', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
    );
  }
}