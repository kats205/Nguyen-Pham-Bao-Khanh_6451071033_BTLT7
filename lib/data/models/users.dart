class UserModel{
  String? id;
  String name;
  String email;
  String createAt;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.createAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json["id"].toString(),
      name: json["name"].toString(),
      email: json["email"].toString(),
      createAt: json["createdAt"].toString(),
    );
  }

  Map<dynamic, String> toJson(){
    return{
      'id' : id!,
      'name': name,
      'email': email,
      'createdAt': createAt
    };
  }

  Map<String, dynamic> toPatchJson({
    bool updateName = false,
    bool updateEmail = false,
  }) {
    Map<String, dynamic> data = {};

    if (updateName) {
      data['name'] = name;
    }
    if (updateEmail) {
      data['email'] = email;
    }

    return data;
  }
}