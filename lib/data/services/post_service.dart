import 'package:http/http.dart' as http;
// Giả định bạn đã có file app_constants.dart chứa AppConstants.baseUrl
import 'package:btlt7/utils/appconstant.dart'; 

class PostApiService {
  Future<http.Response> createPost(String jsonBody) async {
    Uri url = Uri.parse('${AppConstants.baseUrl}/posts');
    return await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonBody,
    );
  }
}