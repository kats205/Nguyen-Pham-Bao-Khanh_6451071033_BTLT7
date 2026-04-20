import 'dart:convert';

import 'package:btlt7/data/models/users.dart';
import 'package:btlt7/data/services/user_service.dart';
import 'package:http/http.dart';

class UserRepository {
  final UserApiService apiService = UserApiService();

  Future<List<UserModel>> fetchUser() async{
    final response = await apiService.getUsers();

    if(response.statusCode == 200){
      List<dynamic> jsonList = jsonDecode(response.body);

      List<UserModel> users = [];

      for(var item in jsonList){
        users.add(UserModel.fromJson(item));
      }

      return users;
    }
    else{
      throw Exception(
        'Failed to fetch users, Status Code: ${response.statusCode}'
      );
    }
  }
}