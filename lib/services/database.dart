import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_flutter/models/myUser.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference myUserCollection = Firestore.instance.collection('user');
  final CollectionReference myRecipeCollection = Firestore.instance.collection('recipes');
  final CollectionReference myIngRecCollection = Firestore.instance.collection('ingrecipes');

  Future updateUserData(String name, String email, String username) 
  async {
    return await myUserCollection.document(uid).setData({
      'name': name,
      'email': email,
      'username': username,
      'isPremium': '0'
    });
  }

  Future addIngredientRecipe(String sentence,int ingrecipeid, int recid)
  async{
    //return await myIngRecCollection.add({'cadena': sentence, 'recipeid': recid});
    log('Agregando: ' + sentence + ' ' + recid.toString() +' para ' + uid);
    return await myIngRecCollection.document(uid).collection(uid).document(ingrecipeid.toString())
    .setData({
      'cadena': sentence,
      'recipeid': recid,
    });
  }

  Future addRecipe(String uid, String name, String rating, String steps,String image, int recipeId)
  async{
    //return await myIngRecCollection.add({'cadena': sentence, 'recipeid': recid});
    log('Agregando: ' + name + 'con id: ' + recipeId.toString() +  ' para ' + uid + ' con imagen' + image);
    return await myRecipeCollection.document(uid).collection(uid).document(recipeId.toString())
    .setData({
      'name': name,
      'steps': steps,
      'rating': rating,
      'image': image,
      'id': recipeId,
    });
  }

  /* List<String> getIngrecipes()
  {
    List<String> lista;
    //return await myIngRecCollection.add({'cadena': sentence, 'recipeid': recid});
    log('Gettig increcipes...');
    dynamic result = myIngRecCollection.document(uid).collection(uid).snapshots();
    
    for(var ing in result)
    {
      log('LISTA: ' + ing);
    }

    log('INGRECIPES: ' + result);

    return lista;
  } */

  Future updateUserRecipe(String name, String steps) 
  async {
    return await myRecipeCollection.document(uid).collection(uid).document('1')
    .setData({
      'name': 'Default Recipe',
      'steps': 'Default Steps',
      'rating': '3',
      'image': 'assets/cereal.png',
    });
  }

  Future updateRecipe(String id, String name, String steps, String image, String rating) 
  async {
    return await myRecipeCollection.document(uid).collection(uid).document(id)
    .setData({
      'name': name,
      'steps': steps,
      'rating': rating,
      'image': image,
    });
  }

  //User list from snapshot
  List<myUser> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return myUser(
        name: doc.data['name'] ?? '',
        email: doc.data['email'] ?? '',
        username: doc.data['username'] ?? ''
      );
    }).toList();
  }

  // get user stream
  Stream<List<myUser>> get users{
    return myUserCollection.snapshots().map(_userListFromSnapshot);
  }
}