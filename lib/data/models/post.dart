class PostModel {
  String? id;
  String title;
  String? picture;

  PostModel({this.id, required this.title, this.picture});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json["id"]?.toString(),
      title: json["title"].toString(),
      picture: json["picture"]?.toString(),
    );
  }

  Map<dynamic, String> toJson() {
    Map<dynamic, String> data = {'title': title};
    if (id != null) data['id'] = id!;
    if (picture != null) data['picture'] = picture!;
    return data;
  }

  Map<String, dynamic> toPatchJson({bool updateTitle = false, bool updatePicture = false}) {
    Map<String, dynamic> data = {};
    if (updateTitle) data['title'] = title;
    if (updatePicture && picture != null) data['picture'] = picture;
    return data;
  }
}