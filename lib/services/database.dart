import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_flutter/models/myUser.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference myUserCollection = Firestore.instance.collection('user');

  Future updateUserData(String name, String email, String username) 
  async {
    return await myUserCollection.document(uid).setData({
      'name': name,
      'email': email,
      'username': username
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