class UserProfileModel {
  String? id;
  String fullName;
  String phoneNumber;
  String email;

  UserProfileModel({
    this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json["id"]?.toString(),
      fullName: json["fullName"].toString(),
      phoneNumber: json["phoneNumber"].toString(),
      email: json["email"].toString(),
    );
  }

  Map<dynamic, String> toJson() {
    Map<dynamic, String> data = {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
    if (id != null) data['id'] = id!;
    return data;
  }

  Map<String, dynamic> toPatchJson({
    bool updateFullName = false,
    bool updatePhoneNumber = false,
    bool updateEmail = false,
  }) {
    Map<String, dynamic> data = {};
    if (updateFullName) data['fullName'] = fullName;
    if (updatePhoneNumber) data['phoneNumber'] = phoneNumber;
    if (updateEmail) data['email'] = email;
    return data;
  }
}