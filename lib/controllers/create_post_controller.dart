import 'package:btlt7/data/models/post.dart';
import 'package:flutter/material.dart';
import '../data/repository/post_repository.dart';

class CreatePostController extends ChangeNotifier {
  final PostRepository repository = PostRepository();
  
  bool isLoading = false;
  String? errorMessage;

  Future<bool> submitPost({required String title, String? picture}) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final newPost = PostModel(title: title, picture: picture);
      await repository.createNewPost(newPost);
      return true; 
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}