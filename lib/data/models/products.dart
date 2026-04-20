class ProductModel{
  String? id;
  String title;
  double price;
  String description;

  ProductModel({
    this.id,
    required this.title,
    required this.price,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json["id"].toString(),
      title: json["title"].toString(),
      price: (json["price"] as num).toDouble() ,
      description: json["description"].toString(),
    );
  }

  Map<dynamic, String> toJson(){
    return{
      'id' : id!,
      'title': title,
      'price': price.toString(),
      'description': description
    };
  }

  Map<String, dynamic> toPatchJson({
    bool updateTitle = false,
    bool updatePrice = false,
    bool updateDescription = false
  }) {
    Map<String, dynamic> data = {};

    if (updateTitle) {
      data['title'] = title;
    }
    if (updatePrice) {
      data['price'] = price;
    }
    if (updateDescription) {
      data['description'] = description;
    }
    return data;
  }
}