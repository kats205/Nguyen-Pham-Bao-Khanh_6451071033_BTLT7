import 'package:btlt7/utils/appconstant.dart';
import 'package:http/http.dart' as http;

class NewsApiService {
  Future<http.Response> getNews() async {
    Uri url = Uri.parse('${AppConstants.baseUrl}/news');
    return await http.get(url, headers: {'Accept': 'application/json'});
  }
}