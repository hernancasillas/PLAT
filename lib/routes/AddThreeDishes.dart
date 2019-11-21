
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'package:examen_flutter/widgets/raisedgradbutton.dart';


class GoPremium extends StatelessWidget {
  static const String routeName = '/routes/Add3Recipes';
  final style =  new TextStyle(fontFamily: 'Montserrat');


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       
        appBar: GradientAppBar(
        title: Text('ADD 3 DISHES'),
        gradient: /* LinearGradient(colors: [Colors.blue, Colors.purple, Colors.red]) */
                  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF064B71), const Color(0xFF2692C2)],
              ),
              
      ),
        
        body: Center(
          child:Column(
            children:<Widget>[
               GestureDetector(
               child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                //margin: EdgeInsets.symmetric(horizontal: 5.0),
                                height: 150,
                                child: Image.asset("assets/fideo.png", fit: BoxFit.contain,)
                                //Text('text $i', style: TextStyle(fontSize: 16.0),)
                                ),
                                onTap: (){
                                  /*ADD RECIPE*/
                                },
              ),
              Divider(height: 10,),
               GestureDetector(
               child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                //margin: EdgeInsets.symmetric(horizontal: 5.0),
                                height: 100,
                                child: Image.asset("assets/logo_plus.png", fit: BoxFit.contain,)
                                //Text('text $i', style: TextStyle(fontSize: 16.0),)
                                ),
                                onTap: (){
                                  /*ADD RECIPE*/
                                },
              ),
                      Divider(height: 10,),
             GestureDetector(
               child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                //margin: EdgeInsets.symmetric(horizontal: 5.0),
                                height: 100,
                                child: Image.asset("assets/logo_plus.png", fit: BoxFit.contain,)
                                //Text('text $i', style: TextStyle(fontSize: 16.0),)
                                ),
                                onTap: (){
                                  /*ADD RECIPE*/
                                },
              ),
                
                      Divider(height: 10,),
                      
                       RaisedGradientButton(
                         width: 100,
          gradient: LinearGradient(
            colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce)]
          ),
          
          onPressed: (){
            /*De aqui se va HOME*/
          },
           
          child: Text("Done",
            textAlign: TextAlign.center,
            style: style.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold)),
        ),
            ],
          ),
          )
      );
  }
}