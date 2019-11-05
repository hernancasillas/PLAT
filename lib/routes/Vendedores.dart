import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/routes/Vendedor.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Vendedores extends StatelessWidget {
  static const String routeName = '/routes/Vendedores';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Vendedores"),
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
                leading: Icon(Icons.person, size: 50),
                title: Text('Vendedor 1', style: TextStyle(fontSize: 30)),
                subtitle: Text('Reputación: 5.0', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Vendedor()));
                }
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person, size: 50),
                title: Text('Vendedor 2', style: TextStyle(fontSize: 30)),
                subtitle: Text('Reputación: 4.6', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person, size: 50),
                title: Text('Vendedor 3', style: TextStyle(fontSize: 30)),
                subtitle: Text('Reputación: 4.3', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person, size: 50),
                title: Text('Vendedor 4', style: TextStyle(fontSize: 30)),
                subtitle: Text('Reputación: 4.0', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person, size: 50),
                title: Text('Vendedor 5', style: TextStyle(fontSize: 30)),
                subtitle: Text('Reputación: 3.2', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person, size: 50),
                title: Text('Vendedor 6', style: TextStyle(fontSize: 30)),
                subtitle: Text('Reputación: 3.0', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person, size: 50),
                title: Text('Vendedor 7', style: TextStyle(fontSize: 30)),
                subtitle: Text('Reputación: 2.5', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person, size: 50),
                title: Text('Vendedor 8', style: TextStyle(fontSize: 30)),
                subtitle: Text('Reputación: 2.0', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person, size: 50),
                title: Text('Vendedor 9', style: TextStyle(fontSize: 30)),
                subtitle: Text('Reputación: 1.0', style: TextStyle(fontSize: 20)),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
    );
  }
}