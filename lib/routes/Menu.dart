import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/routes/ViewRecipe.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Menu extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
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
                  builder: (BuildContext context) => MainScreen()));
              },
            ),
          ],
      ),
        drawer: AppDrawer(),
        body: Center(
          child:ListView(
            children:<Widget>[
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height:100,
                  width: 200,
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Monday 4th:\n\nMeatballs",style:TextStyle(fontSize: 20),),
                      Container(
                      height: 100,
                      width: 200,
                      child: GestureDetector(
                        child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.symmetric(horizontal: 5.0),
                        height: 150,
                        child: Image.asset("assets/albondigas.png", fit: BoxFit.contain,)
                        //Text('text $i', style: TextStyle(fontSize: 16.0),)
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ViewRecipe(image: 'assets/albondigas.png', titulo: 'Meatballs')));
                        },
                      ),
        
                    ),
                      
                    ],
                  ),
                ),
                ),
                SizedBox(height:5),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height:100,
                  width: 200,
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Tuesday 5th:\n\nCereal",style:TextStyle(fontSize: 20),),
                      Container(
                      height: 100,
                      width: 200,
                      child: GestureDetector(
                        child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.symmetric(horizontal: 5.0),
                        height: 150,
                        child: Image.asset("assets/cereal.png", fit: BoxFit.contain,)
                        //Text('text $i', style: TextStyle(fontSize: 16.0),)
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ViewRecipe(image: 'assets/cereal.png', titulo: 'Cereal')));
                        },
                    ),
        
                  ),
                  
                    ],
                  ),
                ),
                ),
                  SizedBox(height:5),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height:100,
                  width: 200,
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Wednesday 6th:\n\nFried Rice",style:TextStyle(fontSize: 20),),
                      Container(
                      height: 100,
                      width: 150,
                      child: GestureDetector(
                        child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.symmetric(horizontal: 5.0),
                        height: 150,
                        child: Image.asset("assets/arroz_frito.png", fit: BoxFit.contain,)
                        //Text('text $i', style: TextStyle(fontSize: 16.0),)
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ViewRecipe(image: 'assets/arroz_frito.png', titulo:'Fried Rice')));
                        },
                    ),
        
                  ),
                      
                    ],
                  ),
                ),
                ),
                  SizedBox(height:5),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height:100,
                  width: 200,
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Thursday 7th:\n\nCheesecake",style:TextStyle(fontSize: 20),),
                      Container(
                      height: 100,
                      width: 200,
                      child: GestureDetector(
                        child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.symmetric(horizontal: 5.0),
                        height: 150,
                        child: Image.asset("assets/cheesecake.png", fit: BoxFit.contain,)
                        //Text('text $i', style: TextStyle(fontSize: 16.0),)
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ViewRecipe(image: 'assets/cheesecake.png' ,titulo:'Cheesecake')));
                        },
                    ),
        
                  ),
                    ],
                  ),
                ),
                ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height:100,
                  width: 200,
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Friday 8th:\n\nEnchiladas",style:TextStyle(fontSize: 20),),
                      Container(
                      height: 100,
                      width: 200,
                      child: GestureDetector(
                        child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.symmetric(horizontal: 5.0),
                        height: 150,
                        child: Image.asset("assets/enchiladas.png", fit: BoxFit.contain,)
                        //Text('text $i', style: TextStyle(fontSize: 16.0),)
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ViewRecipe(image: 'assets/enchiladas.png', titulo:'Enchiladas')));
                        },
                    ),
        
                  ),
                    ],
                  ),
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height:100,
                  width: 200,
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Saturday 9th:\n\nEnfrijoladas",style:TextStyle(fontSize: 20),),
                      Container(
                      height: 100,
                      width: 200,
                      child: GestureDetector(
                        child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.symmetric(horizontal: 5.0),
                        height: 150,
                        child: Image.asset("assets/enfrijoladas.png", fit: BoxFit.contain,)
                        //Text('text $i', style: TextStyle(fontSize: 16.0),)
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ViewRecipe(image: 'assets/enfrijoladas.png', titulo: 'Enfrijoladas')));
                        },
                    ),
        
                  ),
                    ],
                  ),
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height:100,
                  width: 200,
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                        Text("Sunday 11th:\n\nLentils",style:TextStyle(fontSize: 20),),
                        
                        ],
                        ),
                      Column(
                        children:<Widget>[
                        Container(
                          height: 100,
                          width: 200,
                          child: GestureDetector(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              //margin: EdgeInsets.symmetric(horizontal: 5.0),
                              height: 150,
                              child: Image.asset("assets/lentejas.png", fit: BoxFit.contain,)
                              //Text('text $i', style: TextStyle(fontSize: 16.0),)
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => ViewRecipe(image: 'assets/lentejas.png', titulo: 'Lentils')));
                            },
                          ),
                        ),
                        ],
                      ),
                      ],
                  ),
                ),
                ),
            ],
          ),
          )
      );
  }
}