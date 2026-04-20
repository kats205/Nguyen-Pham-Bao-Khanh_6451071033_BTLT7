import 'dart:convert';

import 'package:btlt7/data/models/products.dart';
import 'package:btlt7/data/services/product_service.dart';
import 'package:http/http.dart';

class ProductRepository{
  final ProductApiService service = ProductApiService();

  Future<ProductModel> fetchProduct(String id) async{
    try
    {
      final response = await service.getProductById(id);
      if(response.statusCode == 200){
        dynamic itemJson = jsonDecode(response.body);

        return ProductModel.fromJson(itemJson);
      }
      else if(response.statusCode == 404){
        throw Exception('ID $id is not exist!');
      }
      else{
        throw Exception('Failed to load product detail, Status Code: ${response.statusCode}');
      }
    }
    catch(e){
      throw Exception('Error Fetching Product Detail: $e');
    }
  }
}