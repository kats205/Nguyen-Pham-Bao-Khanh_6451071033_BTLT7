import 'package:btlt7/utils/appconstant.dart';
import 'package:http/http.dart' as http;

class UserProfileApiService {
  Future<http.Response> getUserProfile(String id) async {
    Uri url = Uri.parse('${AppConstants.baseUrl}/userProfile/$id');
    return await http.get(url, headers: {'Accept': 'application/json'});
  }

  Future<http.Response> updateUserProfile(String id, String jsonBody) async {
    Uri url = Uri.parse('${AppConstants.baseUrl}/userProfile/$id');
    return await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonBody,
    );
  }
}