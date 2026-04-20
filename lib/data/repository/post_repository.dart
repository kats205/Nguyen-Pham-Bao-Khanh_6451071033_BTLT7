import 'dart:convert';
import 'package:btlt7/data/models/post.dart';
import '../services/post_service.dart';

class PostRepository {
  final PostApiService service = PostApiService();

  Future<PostModel> createNewPost(PostModel post) async {
    try {
      String jsonBody = jsonEncode(post.toJson());
      
      final response = await service.createPost(jsonBody);

      // In log response từ server ra console
      print('=== Server Response (Create Post) ===');
      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');
      print('=====================================');

      // Xử lý status code 201 cho trạng thái Create thành công
      if (response.statusCode == 201) {
        dynamic itemJson = jsonDecode(response.body);
        return PostModel.fromJson(itemJson);
      } else if (response.statusCode == 400) {
        throw Exception('Bad Request: Invalid data provided.');
      } else {
        throw Exception('Failed to create post, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error Creating Post: $e');
    }
  }
}