import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/routes/Producto.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Productos extends StatelessWidget {
  static const String routeName = '/routes/EventsPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Productos"),
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
                leading: Icon(Icons.book, size: 50),
                title: Text('Producto 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Producto1(image: 'assets/sneakers.png')));
                }
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Producto 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Producto 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Producto 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Producto 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Producto 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Producto 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Producto 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text('Producto 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Precio: \$\$\$', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
    );
  }
}