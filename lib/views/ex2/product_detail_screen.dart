import 'package:btlt7/controllers/product_detail_controller.dart';
import 'package:btlt7/controllers/user_controller.dart';
import 'package:btlt7/data/models/users.dart';
import 'package:btlt7/views/ex1/users_list.dart';
import 'package:btlt7/views/ex2/product_detail.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProductDetailScreenState();
  }
}

class ProductDetailScreenState extends State<ProductDetailScreen>{
  final ProductDetailController controller = ProductDetailController();
  final _form_key = GlobalKey<FormState>();
  final TextEditingController id_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    id_controller.dispose();
  }

  void submit(){
    if(_form_key.currentState!.validate()){
      String id = id_controller.text;
      controller.loadProductDetail(id);
      if(controller.product == null){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Product is not exist")
          )
        );
      }

      id_controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail - 6451071033"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.phone),
          )
        ],
      ),
      body: Column(
        children:[ 
          Form(
            key: _form_key,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Product Id",
                      hintText: "Enter Product Id",
                      alignLabelWithHint: true,
                      border: OutlineInputBorder()
                    ),
                    controller: id_controller,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return ("Please enter product id");
                      }
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height:20,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: submit,
                    child: Text("Submit")),
                )
              ],
            )
          ),
          ListenableBuilder(
            listenable: controller,
            builder: (context, child){
              if(controller.isLoading){
                return const Center(child: CircularProgressIndicator());
              }
              if(controller.product == null){
                return const Center(child: Text("Enter product's id for details"));
              }
              return ProductDetail(product:controller.product!, controller: controller,);
            }
          ),
        ]
      )
  
    );
  }
}