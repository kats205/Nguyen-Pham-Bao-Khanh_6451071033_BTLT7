import 'dart:convert';
import 'package:btlt7/data/models/news.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/news_service.dart';

class NewsRepository {
  final NewsApiService service = NewsApiService();
  static const String _cacheKey = 'news_cache_data';

  Future<List<NewsModel>> fetchNews({bool forceRefresh = false}) async {
    final prefs = await SharedPreferences.getInstance();

    // 1. Kiểm tra cache trước nếu không phải là thao tác kéo thả làm mới (pull to refresh)
    if (!forceRefresh) {
      final String? cachedJson = prefs.getString(_cacheKey);
      if (cachedJson != null) {
        List<dynamic> listJson = jsonDecode(cachedJson);
        return listJson.map((json) => NewsModel.fromJson(json)).toList();
      }
    }

    // 2. Gọi API nếu forceRefresh = true hoặc cache rỗng
    try {
      final response = await service.getNews();
      if (response.statusCode == 200) {
        // Lưu trữ (Cache) JSON response vào bộ nhớ cục bộ ngay khi thành công
        await prefs.setString(_cacheKey, response.body);

        List<dynamic> listJson = jsonDecode(response.body);
        return listJson.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // 3. Fallback: Nếu lỗi mạng khi pull-to-refresh, ném lỗi ra Controller để hiển thị Toast/Error
      throw Exception('Lỗi kết nối hoặc máy chủ. Vui lòng kiểm tra lại mạng!');
    }
  }
}