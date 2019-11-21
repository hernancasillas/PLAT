import 'dart:developer';

import 'package:examen_flutter/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:examen_flutter/widgets/raisedgradbutton.dart';



class AddRecipe extends StatefulWidget {
  static final List arr = ["1", "2", "3", "4", "5"];
  static final List units = ["kg", "gr", "cup", "tablespoon","teaspoon", "pinch", "package", "can"];


  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final recipeName = TextEditingController();
  final recipeSteps = TextEditingController();
  var ingredients = new List<String>();
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
    return StreamBuilder(
      stream: Firestore.instance.collection('ingredients').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData)
        {
          return Text("No data...");
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
        drawer: AppDrawer(),
        body: ListView(shrinkWrap: true,
            children:<Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
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
                  initialRating: 5,
                  fillColor: Colors.amber,
                  borderColor: Colors.amber.withAlpha(50),
                  allowHalfRating: true,
                  onRatingUpdate: (rating) {
                      print(rating);
                  },
                ),
                  
                Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      
                        new Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SettingsWidget(foo: AddRecipe.arr),
                        ),
                      
                      new Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SettingsWidget(foo: AddRecipe.units),
                        ),
                      
                      Text('of'),
                      getIngs(snapshot,context, ingredients),
                      
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
                        },
                      child: Icon(
                        Icons.plus_one,
                        color: Colors.white,
                        size: 25.0,
                      )          
                    ),
                    SizedBox(height: 20,),
                Text('Ingredients'),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Padding(padding: const EdgeInsets.all(0),
                    child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    expands: true,
                    ),
                  ),
                  height: 100,
                  decoration: BoxDecoration(border: Border.all()),
                ),
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
}


getIngs(AsyncSnapshot<QuerySnapshot> snapshot, context, ingredients)
{
    log('INGREDIENTS: ' + snapshot.data.documents.toString());
    for(var ing in snapshot.data.documents)
    {
      ingredients.add(ing['name']);
    }
    ingredients.add("test");
    //ingredients.sort((a,b) => a.compareTo(b));
    
    return new Padding(
        padding: const EdgeInsets.all(10.0),
        child: SettingsWidget(foo: ingredients),
    );
}
  

class SettingsWidget extends StatefulWidget {
  final List foo;


  SettingsWidget({Key key, this.foo}) : super(key: key);

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
              )/* new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[              
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              new DropdownButton(
                value: _currentCity,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              )
            ],
          )
      ), */
    );
  }

  void changedDropDownItem(String selectedValue) {
    setState(() {
      _currentValue = selectedValue;
    });
  }

}