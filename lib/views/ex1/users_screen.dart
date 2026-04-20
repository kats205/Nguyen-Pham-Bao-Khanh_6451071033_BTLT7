import 'package:btlt7/controllers/user_controller.dart';
import 'package:btlt7/data/models/users.dart';
import 'package:btlt7/views/ex1/users_list.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return UsersScreenState();
  }
}

class UsersScreenState extends State<UserScreen>{
  final UserController controller = UserController();

  @override
  void initState() {
    super.initState();
    controller.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact - 6451071033"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.phone),
          )
        ],
      ),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, child){
          if(controller.isLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(controller.users.isEmpty){
            return const Center(child: Text("Không có dữ liệu người dùng"));
          }
          return UsersList(users: controller.users, controller: controller,);
        }
      )
  
    );
  }
}