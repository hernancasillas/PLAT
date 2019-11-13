import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ViewRecipe extends StatelessWidget {
  static const String routeName = '/routes/ViewRecipe';

  final String image;
  
  ViewRecipe({Key key, @required this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
                  builder: (BuildContext context) => MainScreen()));
              },
            ),
          ],
      ),
        drawer: AppDrawer(),
        body:ListView(
          children:<Widget>[
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 20, 15, 0),
                child:              
                  Text("Banana crepes", style:TextStyle(fontSize: 25),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(95,5,0,0),
                child:
              FlutterRatingBar(
                  initialRating: 5,
                  fillColor: Colors.amber,
                  borderColor: Colors.amber.withAlpha(50),
                  allowHalfRating: true,
                  onRatingUpdate: (rating) {
                      print(rating);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget>[
                    Container(
                      child :
                        Text("last eaten: March 5th, 2019"),
                      
                    ),
                    Container(
                      child:
                      SizedBox(
                        height: 100,
                        child:  Image.asset(
                          image,
                        ),
                      ) 
                      
                    ),
                  ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                child:
                Text("Ingredients:", style:TextStyle(fontSize: 18),textAlign: TextAlign.left,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 15, 0),
                child:
                Text("- 2 pieces of eggs",style:TextStyle(fontSize: 16), textAlign: TextAlign.left,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 15, 0),
                child:
                Text("- 2 pieces of eggs",style:TextStyle(fontSize: 16), textAlign: TextAlign.left,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 15, 0),
                child:
                Text("- 200 grams of sugar",style:TextStyle(fontSize: 16), textAlign: TextAlign.left,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 15, 0),
                child:
                Text("- 500 ml of milk",style:TextStyle(fontSize: 16), textAlign: TextAlign.left,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 15, 0),
                child:
                Text("- 2 cups of flour",style:TextStyle(fontSize: 16), textAlign: TextAlign.left,),
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
                Text("1. In a large mixing bowl, create a well with flour then add eggs, slowly whisking them into flour. Add sugar and salt and stir until combined. Gradually add the milk, whisking to combine.\n Let batter stand at room temperature until bubbly on top, 15 to 20 minutes.\n\n2.In a small skillet over medium heat, melt butter. About 1/4 cup at a time, drop batter evenly onto pan, swirling it to evenly coat.\n\n3. Wait for 2 minutes, then flip and cook 1 minute more; repeat with remaining batter. Serve crêpes warm with fresh fruit and powdered sugar.",style:TextStyle(fontSize: 16), textAlign: TextAlign.left,),
              ),
              SizedBox(height: 50.0),
            ],
          ),
          ],
        ),

      );
  }
}