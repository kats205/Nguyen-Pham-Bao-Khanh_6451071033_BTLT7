class TaskModel {
  String? id;
  String title;
  String description;

  TaskModel({this.id, required this.title, required this.description});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"]?.toString(),
      title: json["title"].toString(),
      description: json["description"].toString(),
    );
  }

  Map<dynamic, String> toJson() {
    Map<dynamic, String> data = {
      'title': title,
      'description': description,
    };
    if (id != null) data['id'] = id!;
    return data;
  }

  Map<String, dynamic> toPatchJson({bool updateTitle = false, bool updateDescription = false}) {
    Map<String, dynamic> data = {};
    if (updateTitle) data['title'] = title;
    if (updateDescription) data['description'] = description;
    return data;
  }
}