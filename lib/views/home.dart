import 'package:btlt7/routes/app_routes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen - 6451071033"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.home),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, AppRoutes.user_screen);
              },
               child: Text(
                "Exercise 1",
                style: TextStyle(fontWeight: FontWeight.bold),
               )
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, AppRoutes.product_screen);
              },
               child: Text(
                "Exercise 2",
                style: TextStyle(fontWeight: FontWeight.bold),
               )
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, AppRoutes.create_post_screen);
              },
               child: Text(
                "Exercise 3",
                style: TextStyle(fontWeight: FontWeight.bold),
               )
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, AppRoutes.user_profile_screen);
              },
               child: Text(
                "Exercise 4",
                style: TextStyle(fontWeight: FontWeight.bold),
               )
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, AppRoutes.task_screen);
              },
               child: Text(
                "Exercise 5 and 6",
                style: TextStyle(fontWeight: FontWeight.bold),
               )
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, AppRoutes.news_screen);
              },
               child: Text(
                "Exercise 7 and 9 ",
                style: TextStyle(fontWeight: FontWeight.bold),
               )
            ),
          ],
        ),
      ),
    );
  }
  
}