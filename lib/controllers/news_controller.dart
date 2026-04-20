import 'package:btlt7/data/models/news.dart';
import 'package:flutter/material.dart';
import '../data/repository/news_repository.dart';

class NewsController extends ChangeNotifier {
  final NewsRepository repository = NewsRepository();
  
  List<NewsModel> newsList = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadNews({bool isRefresh = false}) async {
    // Chỉ bật loading vòng tròn chính giữa khi lần đầu mở app (không phải kéo refresh)
    if (!isRefresh && newsList.isEmpty) {
      isLoading = true;
      notifyListeners();
    }
    
    errorMessage = null;

    try {
      // Truyền isRefresh xuống Repo để biết có bỏ qua Cache hay không
      newsList = await repository.fetchNews(forceRefresh: isRefresh);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}