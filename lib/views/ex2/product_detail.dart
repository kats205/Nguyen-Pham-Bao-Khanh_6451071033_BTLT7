import 'package:btlt7/controllers/product_detail_controller.dart';
import 'package:btlt7/data/models/products.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  final ProductDetailController controller;

  ProductDetail({
    super.key,
    required this.product,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.phone_android),
        title: Text("Product Detail"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: ${product.title}"),
            Text("Price: ${product.price}"),
            Text("Description: ${product.description}"),
          ],
        ),
      ),
    );
  }
}