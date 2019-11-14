import 'package:carousel_slider/carousel_slider.dart';
import 'package:examen_flutter/routes/AddRecipe.dart';
import 'package:examen_flutter/routes/GoPremium.dart';
import 'package:examen_flutter/routes/Menu.dart';
import 'package:examen_flutter/routes/ViewRecipe.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Home extends StatelessWidget  {
   final style =  new TextStyle(fontFamily: 'Montserrat');
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  builder: (BuildContext context) => AddRecipe()));
              },
            ),
          ],
      ),
      drawer: AppDrawer(),
      body: 
      
      
              Center(
          
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Text('My Recipes', style: TextStyle(fontSize: 25)),
                  CarouselSlider(
                  height: 150.0,
                  
                  items: [1,2,3,4,5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          //margin: EdgeInsets.symmetric(horizontal: 5.0),
                          height: 150,
                          child: Image.asset("assets/crepa.png", fit: BoxFit.contain,)
                          //Text('text $i', style: TextStyle(fontSize: 16.0),)
                          ),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => AddRecipe()));
                          },
                        );
                      },
                    );
                  }).toList(),
                  
                ),
            
              /* SizedBox(
            height: 160.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                InkWell(
                  child: SizedBox(
                    width: 160.0,
                    child: Image.asset("assets/sneakers.png", fit: BoxFit.contain),
                    
                  ),
                  onTap: () { Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Producto1(image: 'assets/sneakers.png')));} ,
                ),
                InkWell(
                  child: SizedBox(
                    width: 160.0,
                    child: Image.asset("assets/hoodie.png", fit: BoxFit.contain),
                    
                  ),
                  onTap: () { Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Producto1(image: 'assets/hoodie.png')));} ,
                ),
               InkWell(
                  child: SizedBox(
                    width: 160.0,
                    child: Image.asset("assets/supreme.png", fit: BoxFit.contain),
                    
                  ),
                  onTap: () { Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Producto1(image: 'assets/supreme.png')));} ,
                ),
                InkWell(
                  child: SizedBox(
                    width: 160.0,
                    child: Image.asset("assets/tee.png", fit: BoxFit.contain),
                    
                  ),
                  onTap: () { Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Producto1(image: 'assets/tee.png')));} ,
                ),
              ],
            ),
          ), */
                SizedBox(height: 20,),
                Divider(),
                Text('On the menu', style: TextStyle(fontSize: 25)),
                Container(
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
                              builder: (BuildContext context) => Menu()));
                            },
                          ),
                
                ),
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
          ) 
        
    );
  }
}