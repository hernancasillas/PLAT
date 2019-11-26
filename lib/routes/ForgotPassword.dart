/* import 'package:examen_flutter/main.dart'; */
import 'package:examen_flutter/widgets/raisedgradbutton.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';


final email = TextEditingController();
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
 
class ForgotPassword extends StatelessWidget {
  static const String routeName = '/routes/ForgotPassword';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('Forgot Password'),
        gradient: /* LinearGradient(colors: [Colors.blue, Colors.purple, Colors.red]) */
                  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF064B71), const Color(0xFF2692C2)],
              ),
              
      ),
        
        body: SnackBarPage(),
      );
  }
}

class SnackBarPage extends StatelessWidget {
    final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              controller: email,
        );
   
   
      final sendButton = RaisedGradientButton(
            gradient: LinearGradient(
            colors: <Color>[Color(0xff01ac4d3),Color(0xff0299cce),]
          ),
            onPressed: () {
               if(email.text=='')
               return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text('Email empty'),
                    );
                  },
                );

               else
                  return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text('Recovery email sent'),
                    );
                  },
                ); 
            },
            child: Text("SEND ME RESET PASSWORD",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
        );
    return Center(
           child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Enter your email address below and we'll get "),Text("you back on the track"),
                    SizedBox(height: 50.0),
                    emailField,
                    SizedBox(height: 20.0),
                    sendButton,
                  ],
                ),
              ),
            )
        );
  }
}

