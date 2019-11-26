
import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:examen_flutter/widgets/raisedgradbutton.dart';
import 'package:validators/validators.dart';

bool visaPres=false;
bool masterPres=false;
bool oxxoPres=false;
bool americanPres=false;


final style =  new TextStyle(fontFamily: 'Montserrat');



class GoPremium extends StatelessWidget {

  static const String routeName = '/routes/GoPremium';
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: GradientAppBar(
        title: Text('Go Premium'),
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


        body: Center(
          
          child: Column(children: <Widget>[
            
            BodyGoPremium(),
            
            


          ],),
          )
      );
  }
}




class BodyGoPremium extends StatefulWidget {
  
  @override
  _BodyGoPremium createState() => _BodyGoPremium();
}



class _BodyGoPremium extends State<BodyGoPremium> {
 
  // Variables iniciales
  static Color colorNoPress=Colors.grey;
  static Color colorPress=Colors.black;

final _formKey = GlobalKey<FormState>();


  Color colorVisa=colorNoPress;
  Color colorMaster=colorNoPress;
  Color colorOxxo=colorNoPress;
  Color colorAmerican=colorNoPress;
  //visapress =1
//master= 2
//oxxo press=3
//american press=4; 
  void _toggleVisa() {
    setState(() {
      visaPres=true;
        masterPres=false;
        oxxoPres=false;
        americanPres=false;

        colorVisa=colorPress;
        colorMaster=colorNoPress;
        colorOxxo=colorNoPress;
        colorAmerican=colorNoPress;
    });
  }
  void _toggleMaster() {
    setState(() {
            visaPres=false;
            masterPres=true;
            oxxoPres=false;
            americanPres=false;

            colorVisa=colorNoPress;
            colorMaster=colorPress;
            colorOxxo=colorNoPress;
            colorAmerican=colorNoPress;
    });
  }
  void _toggleOxxo() {
    setState(() {
              visaPres=false;
              masterPres=false;
              oxxoPres=true;
              americanPres=false;

              colorVisa=colorNoPress;
              colorMaster=colorNoPress;
              colorOxxo=colorPress;
              colorAmerican=colorNoPress;
    });
  }

  void _toggleAmerican() {
    setState(() {
      visaPres=false;
                masterPres=false;
                oxxoPres=false;
                americanPres=true;

                colorVisa=colorNoPress;
                colorMaster=colorNoPress;
                colorOxxo=colorNoPress;
                colorAmerican=colorPress;
    });
  }
  @override
  Widget build(BuildContext context) {
    final buyPremium = RaisedGradientButton(
      width: 150,
          gradient: LinearGradient(
            colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
          ),
          
           onPressed: () {
             if (_formKey.currentState.validate()) {
                  
            
             }
              
            },
          child: Text("Buy Premium",
            textAlign: TextAlign.center,
            style: style.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold)),
        );
  
    final numberField = TextFormField(
          
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Card Number",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
       //   validator: (val) => val.length < 10 && val.length >10 ? 'Numero Correcto' : null,
             validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some a number card';
              }else{
                if(!isNumeric(value) ){
                  return 'Format Incorrect';

                }else{
                  if(value.length!=16){
                    return 'Only 16 digits';
                  }
                }
              
                return null;
              }
            },
          onChanged: (val) {
             // setState(() => pssswd = val);
          },
        );

     final dateField = TextFormField(
          
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "MM/AA",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
         // validator: (val) => val.length < 10 ? 'Numero Correcto' : null,
          validator: (value) {
              if (value.isEmpty) {
                return 'Please a Date of Expiration';
              }else{
                if(!isDate(value) ){
                  return 'Format Incorrect';

                }else{
                  
                }
              
                return null;
              }
            },
          onChanged: (val) {
             // setState(() => passwd = val);
          },
        );
      final cvvField = TextFormField(
          
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "CVV",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
         // validator: (val) => val.length < 10 ? 'Numero Correcto' : null,
          validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some a number card';
              }else{
                if(!isNumeric(value) ){
                  return 'Format Incorrect';

                }else{
                  if(value.length!=3){
                    return 'Only 3 digits';
                  }
                }
              
                return null;
              }
            },
          onChanged: (val) {
             // setState(() => passwd = val);
          },
        );

         final nameField = TextFormField(
          
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Card Owner",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          //validator: (val) => val.length < 10 ? 'Numero Correcto' : null,
           validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a name';
              }else{
                
                return null;
              }
            },
          onChanged: (val) {
             // setState(() => passwd = val);
          },
        );
      return Form(
        key: _formKey,

        child: Column(
            children:<Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                    child: Container(decoration: new BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: colorVisa)
                    ,height: 100,width: MediaQuery.of(context).size.width/3,margin: const EdgeInsets.all(10.0),
                    child: Image.asset("assets/logo_visa.png", fit: BoxFit.contain,),),
                    onTap:_toggleVisa,
                    ),
                    GestureDetector(
                    child: Container(decoration: new BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: colorMaster)
                    ,height: 100,width: MediaQuery.of(context).size.width/3,margin: const EdgeInsets.all(10.0),
                    child: Image.asset("assets/logo_mastercard.png", fit: BoxFit.contain,),
                    ),
                    onTap:_toggleMaster,
                  ),
               
               


              ],
              ),
              





              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: Container(decoration: new BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: colorOxxo),
                    height: 100,width: MediaQuery.of(context).size.width/3,margin: const EdgeInsets.all(10.0),
                    child: Image.asset("assets/logo_oxxo.png", fit: BoxFit.contain,),
                    ),
                    onTap:_toggleOxxo,
                    ),
                    GestureDetector(
                    child: Container(decoration: new BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: colorAmerican),
                    height: 100,width: MediaQuery.of(context).size.width/3,margin: const EdgeInsets.all(10.0),
                    child: Image.asset("assets/logo_americanexpress.png", fit: BoxFit.contain,),
                    ),
                    onTap:_toggleAmerican,
                    ),
                   
                  



              ],),
              Text("texto prueba"),
               Container(
              width:MediaQuery.of(context).size.width/1.4 ,child:numberField
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
              Container(child: cvvField, width:MediaQuery.of(context).size.width/3,margin: const EdgeInsets.all(10.0)),
              Container(child: dateField, width:MediaQuery.of(context).size.width/3,margin: const EdgeInsets.all(10.0))
            ],),
            Container(
              width:MediaQuery.of(context).size.width/1.4 ,child:nameField,margin:const EdgeInsets.only(bottom: 10)
            ),
            buyPremium,
            ],
          ),



      );
             
      
  }
}