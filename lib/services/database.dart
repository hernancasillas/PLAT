import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_flutter/models/myUser.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference myUserCollection = Firestore.instance.collection('user');
  final CollectionReference myRecipeCollection = Firestore.instance.collection('recipes');

  Future updateUserData(String name, String email, String username) 
  async {
    return await myUserCollection.document(uid).setData({
      'name': name,
      'email': email,
      'username': username
    });
  }

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