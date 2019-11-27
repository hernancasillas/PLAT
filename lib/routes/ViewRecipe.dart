import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_flutter/routes/ViewAllRecipes.dart';
/* import 'package:examen_flutter/genShoppingList.dart';
import 'package:examen_flutter/main.dart'; */
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/widgets/loading.dart';
import 'package:examen_flutter/widgets/raisedgradbutton.dart';
import 'package:examen_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ViewRecipe extends StatefulWidget {
  static const String routeName = '/routes/ViewRecipe';

  final String image;
  final String titulo;
  final user;
  final String rating;
  final String steps;
  final int recipeId;
  

  ViewRecipe({Key key, @required this.user, @required this.image, @required this.titulo, @required this.rating, @required this.steps, @required this.recipeId}) : super(key: key);

  @override
  _ViewRecipeState createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  var rating2;
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
    return StreamBuilder(
      stream: Firestore.instance.collection("ingrecipes").document(widget.user.uid).collection(widget.user.uid).snapshots(),
      builder: (context, snapshot1){
        if(!snapshot1.hasData)
        {
          return Loading();
        }
    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('View Recipe'),
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
        drawer: AppDrawer(user: widget.user),
        body:StreamBuilder( 
          stream: Firestore.instance.collection('recipes').document(widget.user.uid).collection(widget.user.uid).document('1').snapshots(),
          builder: (context, snapshot) {

            if(!snapshot.hasData)
              {
                return Loading();
              }
              var recipeDocument = snapshot.data;

            return ListView(
              children:<Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 20, 15, 0),
                    child:              
                      Text(widget.titulo, style:TextStyle(fontSize: 25),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(95,5,0,0),
                    child:
                  FlutterRatingBar(
                      initialRating: double.parse(widget.rating),
                      fillColor: Colors.amber,
                      borderColor: Colors.amber.withAlpha(50),
                      allowHalfRating: true,
                      onRatingUpdate: (rating) {
                          print(rating);
                          setState(() {
                            rating2 = rating;
                          });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        Container(
                          child:
                          SizedBox(
                            height: 100,
                            child:  Image.asset(
                              widget.image,
                            ),
                          ) 
                          
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                    child:
                    Text('Ingredients', style:TextStyle(fontSize: 18),textAlign: TextAlign.left,),
                  ),
                  Container(
                    height: 100,
                    
                    child:
                    Column(children:getIngredients(snapshot1, context, this.widget.recipeId),),
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                    child:
                    Text("Steps:", style:TextStyle(fontSize: 18),textAlign: TextAlign.left,),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 15, 0),
                    child:
                    //Text("1. In a large mixing bowl, create a well with flour then add eggs, slowly whisking them into flour. Add sugar and salt and stir until combined. Gradually add the milk, whisking to combine.\n Let batter stand at room temperature until bubbly on top, 15 to 20 minutes.\n\n2.In a small skillet over medium heat, melt butter. About 1/4 cup at a time, drop batter evenly onto pan, swirling it to evenly coat.\n\n3. Wait for 2 minutes, then flip and cook 1 minute more; repeat with remaining batter. Serve crêpes warm with fresh fruit and powdered sugar.",style:TextStyle(fontSize: 16), textAlign: TextAlign.left,),
                    Text(widget.steps,style:TextStyle(fontSize: 16), textAlign: TextAlign.left,),
                  ),
                  SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        Container(
                          child:
                           RaisedGradientButton(
                      width: 150,
                      
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
                      ),
                      onPressed: () {
                            
                              //return await myIngRecCollection.add({'cadena': sentence, 'recipeid': recid});
                              log('Agregando: ' + rating2.round().toString() + 'con id: ' + widget.recipeId.toString() +  ' para ' + widget.user.uid);
                              Firestore.instance.collection('recipes').document(widget.user.uid).collection(widget.user.uid).document(widget.recipeId.toString())
                              .updateData({
                                'rating': rating2.round().toString(),
                              });
                      },
                      child: Text("Save",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)
                      ),          
                    ),
                          
                        ),
                        Container(child: 
                        RaisedGradientButton(
                      width: 150,
                      
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
                      ),
                      onPressed: () {
                            
                              //return await myIngRecCollection.add({'cadena': sentence, 'recipeid': recid});
                              Navigator.of(context).push(MaterialPageRoute(
                               builder: (BuildContext context) => ViewAllRecipes(user: widget.user,)));
                      },
                      child: Text("View All",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)
                      ),          
                    ),)
                      ]
                    ),
                  ),
                   
                   
                ],
              ),
              ],
            );
          }
      
        ),

      );
      }
    );
  }

getIngredients(AsyncSnapshot<QuerySnapshot> snapshot, context, recipeid){
    var ings = new List<DocumentSnapshot>();
    var docs = snapshot.data.documents;

    for(DocumentSnapshot dc in docs)
    {
      if(dc['recipeid'] == recipeid)
      {
        ings.add(dc);
      }
    }
   
    return ings.map((doc) => new 
       Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 15, 0),
                    child:
                    Text(doc['cadena'],style:TextStyle(fontSize: 16), textAlign: TextAlign.left,),
                  ),      
    )
    .toList();

  }
}