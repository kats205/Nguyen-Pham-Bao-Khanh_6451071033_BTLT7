import 'package:btlt7/data/models/users.dart';
import 'package:btlt7/data/repository/user_repository.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier{
  final UserRepository repository = UserRepository();

  List<UserModel> users = [];
  bool isLoading = false;

  Future<void> loadUsers() async{
    isLoading = true;
    notifyListeners();

    users = await repository.fetchUser();

    isLoading = false;
    notifyListeners();
  }
}