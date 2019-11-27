/* import 'package:examen_flutter/main.dart'; */
/* import 'package:examen_flutter/widgets/drawer.dart'; */
import 'package:examen_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:examen_flutter/services/database.dart';
import 'package:examen_flutter/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ViewShoppingList extends StatelessWidget {
  final user;

  ViewShoppingList({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection("ingrecipes").document(user.uid).collection(user.uid).snapshots(),
      builder:(context, snapshot1){
        if(!snapshot1.hasData)
        {
          return Loading();
        }
    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('Shopping List'),
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
                  builder: (BuildContext context) => Wrapper()));
              },
            ),
          ],
      ),
        /* drawer: AppDrawer(), */
        body: Center(
          child:Column(
            children: getShop(snapshot1, context, user),
            
          ),
          )
      );
      }
    );
  }
}
getShop(AsyncSnapshot<QuerySnapshot> snapshot, context, user){
    
    var docs = snapshot.data.documents;

    return docs.map((doc) => new Column(
      
      children:<Widget>[

     SizedBox(height: 10,),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.shopping_basket, size: 50),
                              title: Text(doc['cadena'], style: TextStyle(fontSize: 25)),
                              
                              trailing: Icon(Icons.more_vert),
                              onTap: () {
                                //Navigator.of(context).push(MaterialPageRoute(
                                //builder: (BuildContext context) => GoPremium(user: user)));
                              }
                            ),
                          ),
      ],      
    )
    )
    .toList();

  }
