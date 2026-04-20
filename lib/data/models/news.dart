class NewsModel {
  String? id;
  String title;
  String content;

  NewsModel({this.id, required this.title, required this.content});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json["id"]?.toString(),
      title: json["title"].toString(),
      content: json["content"].toString(),
    );
  }

  Map<dynamic, String> toJson() {
    Map<dynamic, String> data = {
      'title': title,
      'content': content,
    };
    if (id != null) data['id'] = id!;
    return data;
  }

  Map<String, dynamic> toPatchJson({bool updateTitle = false, bool updateContent = false}) {
    Map<String, dynamic> data = {};
    if (updateTitle) data['title'] = title;
    if (updateContent) data['content'] = content;
    return data;
  }
}