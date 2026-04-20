import 'package:btlt7/data/models/products.dart';
import 'package:btlt7/data/models/users.dart';
import 'package:btlt7/data/repository/product_repository.dart';
import 'package:btlt7/data/repository/user_repository.dart';
import 'package:flutter/material.dart';

class ProductDetailController extends ChangeNotifier{
  final ProductRepository repository = ProductRepository();

  ProductModel? product; 
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadProductDetail(String id) async{
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try{
      product = await repository.fetchProduct(id);
    }catch(e){
      errorMessage = "Error: Non-exist Products";
    }
    finally{
      isLoading = false;
      notifyListeners();
    }
  }
}