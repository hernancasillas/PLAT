import 'package:flutter/material.dart';
import 'package:examen_flutter/models/myUser.dart';

class UserTile extends StatelessWidget {

  final myUser user;

  UserTile({this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
    );
  }
}