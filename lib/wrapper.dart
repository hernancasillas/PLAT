import 'package:examen_flutter/authenticate.dart';
import 'package:examen_flutter/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen_flutter/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    //return either home or authenticate
    if(user == null)
      return Authenticate();
    else
      return Home();
  }
}