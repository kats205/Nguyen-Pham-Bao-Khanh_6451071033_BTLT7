import 'package:btlt7/controllers/user_controller.dart';
import 'package:btlt7/views/ex1/users_list.dart';
import 'package:btlt7/views/ex1/users_screen.dart';
import 'package:btlt7/views/ex2/product_detail_screen.dart';
import 'package:btlt7/views/ex3/create_post_screen.dart';
import 'package:btlt7/views/ex4/user_profile_screen.dart';
import 'package:btlt7/views/ex5_6/task_screen.dart';
import 'package:btlt7/views/ex7_9/news_list_screen.dart';
import 'package:btlt7/views/home.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String home = "/";
  static const String user_screen ="/user_screen";
  static const String product_screen = "/product_screen";
  static const String create_post_screen ="/create_post_screen";
  static const String user_profile_screen = "/user_profile_screen";
  static const String task_screen = "/task_screen";
  static const String news_screen = "/new_screen";

  static Map<String, WidgetBuilder> routes ={
    home: (context) => Home(),
    user_screen: (context) => UserScreen(),
    product_screen: (context) => ProductDetailScreen(),
    create_post_screen: (context) => CreatePostScreen(),
    user_profile_screen: (context) => UserProfileScreen(userId: "1",),
    task_screen: (context) => TaskListScreen(),
    news_screen: (context) => NewsListScreen()

  };
}