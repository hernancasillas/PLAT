import 'dart:developer';

/* import 'package:examen_flutter/genShoppingList.dart';
import 'package:examen_flutter/main.dart'; */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/widgets/loading.dart';
import 'package:examen_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:examen_flutter/widgets/raisedgradbutton.dart';
import 'package:examen_flutter/services/database.dart';



class AddRecipe extends StatefulWidget {
  static final List arr = ["1", "2", "3", "4", "5"];
  static final List units = ["kg", "gr", "cup", "tablespoon","teaspoon", "pinch", "package", "can"];
  //final ing = 'cereal';
  final user;
  
  AddRecipe({Key key, @required this.user}) : super(key: key);


  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  
  final GlobalKey<_SettingsWidgetState> _key = GlobalKey();
  final GlobalKey<_SettingsWidgetState> _key2 = GlobalKey();

  var ingrecipesLength;
  var recipesLength;
  final recipeName = TextEditingController();
  final recipeSteps = TextEditingController();
  var amount = TextEditingController();
  var unit='kg';
  var ingr='';
  var ingredients = new List<String>();
  var inglist = new List<String>();
  double recipeRating = 5;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
    return StreamBuilder(
      stream: Firestore.instance.collection('ingredients').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData)
        {
          return Loading();
        }
        
        return new Scaffold(
        backgroundColor: Colors.white,
        appBar: GradientAppBar(
        title: Text('Add Recipe'),
        
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
        body: ListView(
            shrinkWrap: true,
            children:<Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                //DatabaseService(uid: widget.user.uid).getIngrecipes(),
                SizedBox(height: 20,),
                TextField(
                
                style: style,
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Recipe Name",
                ),
                controller: recipeName,
                ),
               // Text("Enchiladas", style: TextStyle(fontSize: 25)),
                SizedBox(height: 20,),
                FlutterRatingBar(
                  initialRating: recipeRating,
                  fillColor: Colors.amber,
                  borderColor: Colors.amber.withAlpha(50),
                  allowHalfRating: true,
                  onRatingUpdate: (rating) {
                      print(rating);
                      setState(() {
                        recipeRating = rating;
                      });
                  },
                ),
                  
                Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      
                        new Padding(
                          padding: const EdgeInsets.all(15.0),
                          child:
                          Container(
                            height:25,
                            width: 50,
                            child: TextField(
                              controller: amount, keyboardType: TextInputType.number,)
                          ),
                        ),
                      
                      new Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SettingsWidget(key: _key, foo: AddRecipe.units,secValue: unit ),
                        ),
                      
                      Text('of'),
                      getIngs(snapshot,context, ingredients,ingr, _key2),
                      
                    ],
                  ),
                  RaisedGradientButton(
                      width: 50,
                      
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
                      ),
                      onPressed: () {
                            /* Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Perfil())); */
                              

                              String cadena = amount.text + ' ' + _key.currentState._currentValue + ' of ' + _key2.currentState._currentValue;
                              inglist.add(cadena);
                              setState(() {
                                inglist = inglist;
                              });
                              //setState del Container de Ingredients
                                //escribir el nuevo ingrediente en la bd con su id y el string
                              addtodb(cadena, ingrecipesLength+1, recipesLength+1, widget.user);
                              //ya esta la funcion addtodb abajo
                              print('Nueva receta string: ' + amount.text + ' ' + _key.currentState._currentValue + ' of ' + _key2.currentState._currentValue);
                        },
                      child: Icon(
                        Icons.plus_one,
                        color: Colors.white,
                        size: 25.0,
                      )          
                    ),
                    SizedBox(height: 20,),
                Text('Ingredients'),
                StreamBuilder(
                  stream: Firestore.instance.collection('ingrecipes').document(widget.user.uid).collection(widget.user.uid).snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData)
                    {
                      return Loading();
                    }
                    Firestore.instance.collection('ingrecipes').document(widget.user.uid).collection(widget.user.uid).getDocuments().then((myIngrecipes){
                      setState((){
                          ingrecipesLength = myIngrecipes.documents.length;
                      });
                      //("MY INGRECIPES ${myIngrecipes.documents.length}");
                    });
                    Firestore.instance.collection('recipes').document(widget.user.uid).collection(widget.user.uid).getDocuments().then((myRecipes){
                      setState((){
                        recipesLength = myRecipes.documents.length;
                      });
                      
                    });
                    //log('LENGTH: ' + lenght);
                    return new Container(
                        margin: const EdgeInsets.all(20),
                        child: Padding(padding: const EdgeInsets.all(0),
                          //child: TextField(
                            //keyboardType: TextInputType.multiline,
                            //maxLines: null,
                            //expands: true,
                          //),
                          child: ListView(
                            children:<Widget>[ 
                              Column(children: <Widget>[
                                  getTextWd(inglist),
                              
                                  
                                  /* snapshot.data.documents.map((doc){
                                    return Text(doc['cadena']);
                                  }).toList(), */
                                  //snapshot.,
                                ],
                              )
                            ],
                          ),
                        ),
                        height: 100,
                        decoration: BoxDecoration(border: Border.all()),
                      );
                  }
                  
                  ,)
                  ,
                /* new Container(
                  margin: const EdgeInsets.all(20),
                  child: Padding(padding: const EdgeInsets.all(0),
                    //child: TextField(
                      //keyboardType: TextInputType.multiline,
                      //maxLines: null,
                      //expands: true,
                    //),
                    child: ListView(
                      children:<Widget>[ Column(children: <Widget>[
                        getTextWd(inglist),
                      ],)],),
                  ),
                  height: 100,
                  decoration: BoxDecoration(border: Border.all()),
                ), */
                Text('Steps'),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Padding(padding: const EdgeInsets.all(0),
                    child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    expands: true,
                    controller: recipeSteps,
                    ),
                  ),
                  height: 100,
                  decoration: BoxDecoration(border: Border.all()),
                ),
                Row(
                  children: <Widget>[
                    new Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 120, 
                            width: 120, 
                            child: Image.asset('assets/enchiladas.png', fit: BoxFit.contain,),
                          ),
                        ),
                    
                    RaisedGradientButton(
                      width: 150,
                      
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
                      ),
                      onPressed: () {
                            /* Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Perfil())); */
                        },
                      child: Text("Change Picture",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)
                      ),          
                    ),
                  ],

                ),
                
              ],
              )
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                  RaisedGradientButton(
                      width: 150,
                      
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
                      ),
                      onPressed: () {
                            /* Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Perfil())); */
                      
                              log('Name ' + recipeName.text);
                              log('Rating ' + recipeRating.round().toString());
                              for(var ing in inglist)
                              {
                                log('Ings ' + ing);
                              }
                              log('Steps ' + recipeSteps.text);
                              addRecipeToDB(widget.user, recipeName.text, recipeRating.round().toString(), recipeSteps.text, 'assets/cereal.png', recipesLength+1);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Wrapper(
                                  )));
                        },
                      child: Text("Add Recipe",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)
                      ),          
                ),
                SizedBox(height: 60,)
                ],)
              ),
            ],
            
          ),
        ); 
      }
    );
  }

  

  Widget getTextWd(List<String> inglist)
  {
    List<Widget> list = new List<Widget>();
    for(var i=0; i<inglist.length; i++)
    {
      list.add(new Text(inglist[i]));
    }

    return new Column(children: list);
  }

//NO SE HACER ESTO
 /* Widget getIngrecipes(List<String> inglist)
  {
    List<Widget> list = new List<Widget>();
    for(var i=0; i<inglist.length; i++)
    {
      list.add(new Text(inglist[i]));
    }

    return new Column(children: list);
  }*/
  
  getIngs(AsyncSnapshot<QuerySnapshot> snapshot, context, ingredients, ingr, _key)
  {
    //log('INGREDIENTS: ' + snapshot.data.documents.toString());
    for(var ing in snapshot.data.documents)
    {
      ingredients.add(ing['name']);
    }
    ingredients.add("test");
    //ingredients.sort((a,b) => a.compareTo(b));
   
    return new Padding(
        padding: const EdgeInsets.all(10.0),
        child: SettingsWidget(key: _key, foo: ingredients, secValue: ingr),
    );
  }
}

addtodb(String cadena, int ingrecipeId, int recipeid, user) async{
  
   try{
      
      log('A punto de agregar!');
      await DatabaseService(uid: user.uid).addIngredientRecipe(cadena, ingrecipeId, recipeid);
      
    }catch(e)
    {
      print(e.toString());
      //return null;
    }

}

addRecipeToDB(user, name, rating, steps, image, recipeId) async{
  try{
    //await DatabaseService(uid: user.uid).addRecipe();
    await DatabaseService(uid: user.uid).addRecipe(user.uid, name, rating, steps, image, recipeId);
  }
  catch(e)
  {
    print(e.toString());
  }
}


  

class SettingsWidget extends StatefulWidget {
  final List foo;
  var secValue;

  SettingsWidget({Key key, this.foo, this.secValue}) : super(key: key);

  @override
  _SettingsWidgetState createState() => new _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentValue;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentValue = _dropDownMenuItems[0].value;
    
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String value in widget.foo) {
      items.add(new DropdownMenuItem(
          value: value,
          child: new Text(value)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new DropdownButton(
                value: _currentValue,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              )
    );
  }

  void changedDropDownItem(String selectedValue) {
    log(selectedValue);
    setState(() {
      widget.secValue=selectedValue;
      _currentValue = selectedValue;
    });
  }

}