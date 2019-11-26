/* import 'package:examen_flutter/services/auth.dart';
import 'package:examen_flutter/services/database.dart'; */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var favs = new List<DocumentSnapshot>();
StreamBuilder<QuerySnapshot> snap;

getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot, context) {
    /* var cont=0; */
    var docs = snapshot.data.documents;
    
    var ind=0;
    /* bool lessthan=false; */

    for(var rec in docs)
    {
      if(ind<=7)
      {  
        if(int.parse(rec['rating'])>=1)
        {
          favs.add(rec);
        }
        ind++;
      }
      else
        break;
    }
    return favs;
  }

class genShoppingList extends StatelessWidget{
  final user;
  genShoppingList({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection("recipes").document(user.uid).collection(user.uid).snapshots(),
      builder: (context, snapshot) {
        favs=getExpenseItems(snapshot, context);
      }
 );}

}