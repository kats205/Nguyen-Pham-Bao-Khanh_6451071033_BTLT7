import 'package:btlt7/controllers/user_controller.dart';
import 'package:btlt7/data/models/users.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget{
  final List<UserModel> users;
  final UserController controller;

  UsersList({
    super.key,
    required this.users,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index){
        final user = users[index];
        return ListTile(
          leading: Icon(Icons.person),
          title: Text(users[index].name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(users[index].email),
              Text(users[index].createAt)
            ],
          ),
        );
      },
          );
  }
}