import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeService{

  //final user;

  //RecipeService({Key key, @required this.user}) : super(key: key);

  getRecipe(String uid){
    return Firestore.instance.collection('recipes').document(uid);//where('email', isEqualTo: uid);
  }
}