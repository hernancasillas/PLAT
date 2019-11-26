import 'dart:developer';
import 'package:examen_flutter/Routes/SizeConfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/routes/ViewRecipe.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Menu extends StatelessWidget {
  final user;
  var lessthan = false;
  var _weekdays = ['Monday', 'Tuesday','Wednesday', 'Thursday', 'Friday','Saturday','Sunday'];
  
  Menu({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder(
      stream: Firestore.instance.collection("recipes").document(user.uid).collection(user.uid).snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData)
        {
          return Text("No data...");
        }
        return new Scaffold(
            appBar: GradientAppBar(
            title: Text('This Week´s Menu'),
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
            drawer: AppDrawer(user: user),
            body: Center(
              child:ListView(
                children:
                getExpenseItems(snapshot, context),

                
              ),
            )
          );
      }
    );
  }
  
  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot, context) {
    var cont=0;
    var docs = snapshot.data.documents;
    var favs = new List<DocumentSnapshot>();
    var ind=0;
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
    if(ind<7)
    {
      lessthan=true;
      while(ind<7)
      {
        for(var rec in docs)
        {
            if(int.parse(rec['rating'])>=1)
          {
            favs.add(rec);
          }
            ind++;
            if(ind>=7)
              break;
        }
      }
    }
      if(!lessthan)
      {
        return favs
            .map((doc) => new 
              Padding(       
                padding: const EdgeInsets.all(30),
                child: Container(
                  height:100,
                  width: SizeConfig.screenWidth,
                  child: 
                  Align(
                    alignment: Alignment.centerRight,
                    child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height:100,
                            width: SizeConfig.screenWidth/4,
                            child:
                              Text(_weekdays[cont]+"\n\n" + doc['name'],style:TextStyle(fontSize: 19),),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[              
                          Container(
                            height: 100,
                            width: SizeConfig.screenWidth/4,
                            child: GestureDetector(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                //margin: EdgeInsets.symmetric(horizontal: 5.0),
                                height: 150,
                                child: Image.asset(doc['image'], fit: BoxFit.contain,)
                                //Text('text $i', style: TextStyle(fontSize: 16.0),)
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => ViewRecipe(
                                    image: doc['image'], 
                                          titulo: doc['name'], 
                                          user: user, rating: 
                                          doc['rating'], 
                                          steps: doc['steps'],
                                          recipeId: doc['id'],
                                          )));
                                      },
                                    ),
                      
                            ),
                              
                          ],
                      ),
                      
                    ],
                  ),
                ),
              ),
          
            ),
          )
            .toList();
      }
      else
      {
        return favs
            .map((doc) => new 
              Padding(       
                padding: const EdgeInsets.all(30),
                child: Column(
                  //height:100,
                  //width: SizeConfig.screenWidth,
                  children:<Widget>[
                  Text('We recommend you add more recipes so that you don´t repeat as much'), 
                  Align(
                    alignment: Alignment.centerRight,
                    child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     
                      Column(
                        children: <Widget>[
                          Container(
                            height:100,
                            width: SizeConfig.screenWidth/4,
                            child:
                              Text(_weekdays[cont]+"\n\n" + doc['name'],style:TextStyle(fontSize: 19),),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[              
                          Container(
                            height: 100,
                            width: SizeConfig.screenWidth/4,
                            child: GestureDetector(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                //margin: EdgeInsets.symmetric(horizontal: 5.0),
                                height: 150,
                                child: Image.asset(doc['image'], fit: BoxFit.contain,)
                                //Text('text $i', style: TextStyle(fontSize: 16.0),)
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => ViewRecipe(
                                    image: doc['image'], 
                                          titulo: doc['name'], 
                                          user: user, rating: 
                                          doc['rating'], 
                                          steps: doc['steps'],
                                          recipeId: doc['id'],
                                          )));
                                      },
                                    ),
                      
                            ),
                              
                          ],
                      ),
                      
                    ],
                  ),
                ),
                ],
              ),
          
            ),
          )
            .toList();
      }
  }

 

}