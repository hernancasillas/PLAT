import 'package:examen_flutter/main.dart';
import 'package:examen_flutter/routes/Carrito.dart';
import 'package:examen_flutter/routes/Opinion.dart';
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Producto1 extends StatelessWidget {
  static const String routeName = '/routes/Producto1';
  
  final String image;
  
  Producto1({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    final opinionButton = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Opinion()));
            },
            child: Text("Opiniones",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
                    
          ),
        );
final comprarButton = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Carrito()));
            },
            child: Text("Comprar",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
                    
          ),
        );

    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('Producto'),
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
           child: ListView(children: <Widget>[
             Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: Hero(
                              tag: 'imageHero',
                              child: SizedBox(
                                height: 200, 
                                width: 200, 
                                child: Image.asset(image),
                                ),
                            ),
                      onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => HeroScreen(image: image)));
            
                      }
                    ,),

                    Text('Descuento: %20', style:TextStyle(fontSize: 20)),
                    SizedBox(height: 20.0),
                    Text('\$2400', style:TextStyle(fontSize: 30)),
                    SizedBox(height: 20.0,),
                    opinionButton,
                    SizedBox(height: 20.0),
                    comprarButton,
                    SizedBox(height: 30.0),
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Text('¿Cuánto tiempo tarda en llegar', 
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                ),
                              SizedBox(height: 20,),
                              Text('3 días hábiles', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                              SizedBox(height: 20,),
                              Text('¿El producto es original?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,),
                              SizedBox(height: 20,),
                              Text('Si, 100% original', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                              SizedBox(height: 20,),
                              Text('¿Realizan envíos a USA?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,),
                              SizedBox(height: 20,),
                              Text('Si, envíos internacionales', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),),
                        ],),)
                      ,)
                  ],
                ),
              ),
            )
           ],)
        )
    );
  }
}

class HeroScreen extends StatelessWidget {
  final String image;
  HeroScreen({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.asset(image),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}