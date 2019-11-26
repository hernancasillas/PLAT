import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:examen_flutter/routes/AddRecipe.dart';
import 'package:examen_flutter/routes/GoPremium.dart';
import 'package:examen_flutter/routes/Menu.dart';
import 'package:examen_flutter/routes/ViewRecipe.dart';
import 'package:examen_flutter/genShoppingList.dart';
import 'package:examen_flutter/user_list.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:examen_flutter/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/myUser.dart';

class Home extends StatelessWidget  {
   final style =  new TextStyle(fontFamily: 'Montserrat');
   final user;
  final favs = new List<DocumentSnapshot>();


   Home({Key key, @required this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<myUser>>.value(
        value: DatabaseService().users,
        child: Scaffold(
        backgroundColor: Colors.white,
        /* appBar: AppBar(
          title: Text('Home'),
        ),  */
        appBar: GradientAppBar(
          title: Text('Dashboard'),
          gradient: /* LinearGradient(colors: [Colors.blue, Colors.purple, Colors.red]) */
                    LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xFF064B71), const Color(0xFF2692C2)],
                ),
          actions: <Widget>[
              // action button
              IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AddRecipe(user: user)));
                },
              ),
            ],
        ),
        drawer: AppDrawer(user: user),
        body: 
                StreamBuilder(
                  stream: Firestore.instance.collection("recipes").document(user.uid).collection(user.uid).snapshots(),
                  builder: (context, snapshot) {

                    //log(snapshot.data.documents.toString());
                    
                    if(!snapshot.hasData)
                      return Loading();
                    else
                    {
                      var doc = snapshot.data.documents;
                    return Center(
            
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        
                        SizedBox(height: 20,),
                        Text('My Recipes', style: TextStyle(fontSize: 25)),
                        CarouselSlider(
                        height: 150.0,
                        
                        items: doc.map<Widget>((recipe) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                //margin: EdgeInsets.symmetric(horizontal: 5.0),
                                height: 150,
                                child: Image.asset( recipe['image'], fit: BoxFit.contain,)
                                //Text('text $i', style: TextStyle(fontSize: 16.0),)
                                ),
                                onTap: (){
                                  
                                  Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => ViewRecipe(
                                    user: user, 
                                    image: recipe['image'], 
                                    titulo: recipe['name'], 
                                    rating: recipe['rating'],
                                    steps: recipe['steps'],
                                    recipeId: recipe['id'],
                                  )));
                                },
                              );
                            },
                          );
                        }).toList(),
                        
                      ),
              
                   
                      SizedBox(height: 20,),
                      Divider(),
                      Text('On the menu', style: TextStyle(fontSize: 25)),
                      /*Container(
                        height: 100,
                        width: 100,
                        child: GestureDetector(
                                  child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  //margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 150,
                                  child: Image.asset("assets/crepa.png", fit: BoxFit.contain,)
                                  //Text('text $i', style: TextStyle(fontSize: 16.0),)
                                  ),
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => Menu(user: user)));
                                  },
                                ),
                      
                      ),*/
                      getExpenseItems(snapshot, context),
                      SizedBox(height: 20,),
                      Divider(),
                      Text('Shopping List', style: TextStyle(fontSize: 25)),
                      Expanded(
                        child: ListView(
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.shopping_basket, size: 50),
                              title: Text('Eggs', style: TextStyle(fontSize: 30)),
                              subtitle: Text('Amount: 12', style: TextStyle(fontSize: 20)),
                              trailing: Icon(Icons.more_vert),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => GoPremium()));
                              }
                            ),
                          ),
                          SizedBox(height: 20,),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.shopping_basket, size: 50),
                              title: Text('Cheese', style: TextStyle(fontSize: 30)),
                              subtitle: Text('Amount: 1', style: TextStyle(fontSize: 20)),
                              trailing: Icon(Icons.more_vert),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => GoPremium()));
                              }
                            ),
                          ),
                          SizedBox(height: 20,),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.shopping_basket, size: 50),
                              title: Text('Tortilla', style: TextStyle(fontSize: 30)),
                              subtitle: Text('Amount: 1 kg', style: TextStyle(fontSize: 20)),
                              trailing: Icon(Icons.more_vert),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => GoPremium()));
                              }
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                      ),
                    ]
              ),
            );
                    }
                    
                  }
                ) 
          
      ),
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
    print(favs.length);
    return CarouselSlider(
      height: 100.0,
                        
      items: favs.map<Widget>((recipe) {
      return Builder(
        builder: (BuildContext context) {
            return GestureDetector(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                      //margin: EdgeInsets.symmetric(horizontal: 5.0),
                         height: 100,
                          child: Image.asset( recipe['image'], fit: BoxFit.contain,)
                                //Text('text $i', style: TextStyle(fontSize: 16.0),)
                             ),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Menu(user: user)));
                          },
              );
          },
        );
      }).toList(),
                        
   );
              

}
}


