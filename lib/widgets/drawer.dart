import 'package:examen_flutter/routes/Categorias.dart';
import 'package:examen_flutter/routes/Perfil.dart';
import 'package:examen_flutter/routes/Productos.dart';
import 'package:examen_flutter/routes/Promociones.dart';
import 'package:examen_flutter/routes/Vendedores.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(context),
          _createDrawerItem(icon: Icons.style,text: 'Categorías', 
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Categorias()));
            },),
          _createDrawerItem(icon: Icons.event, text: 'Productos', 
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Productos()));
            },
          ),
          Divider(),
          _createDrawerItem(icon: Icons.shopping_basket, text: 'Promociones',
            onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Promociones()));
              },
            ),
          _createDrawerItem(icon: Icons.people_outline, text: 'Vendedores', 
            onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Vendedores()));
              },
            ),
          ListTile(
            title: Text('Hernan Casillas 1.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
    
}

Widget _createHeader(BuildContext context) {
        return UserAccountsDrawerHeader(
              accountName: Text("Hernán Casillas", style: TextStyle(fontSize: 20.0),),
              accountEmail: Text("h.casillas@danthop.com",style: TextStyle(fontSize: 20.0),),
              currentAccountPicture: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Perfil()));
              },
              child: CircleAvatar(
                minRadius: 80,
                maxRadius: 120,
                backgroundColor:
                    Colors.white,
                child: Text(
                  "H",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
                
              );
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon, size: 30),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text, style: TextStyle(fontSize: 20),),
        )
      ],
    ),
    onTap: onTap,
  );
}