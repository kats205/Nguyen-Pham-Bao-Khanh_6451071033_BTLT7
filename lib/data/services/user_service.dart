import 'package:btlt7/utils/appconstant.dart';
import 'package:http/http.dart' as http;

class UserApiService{
  Future<http.Response> getUsers() async {
    Uri url = Uri.parse('${AppConstants.baseUrl}/users');

    http.Response response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
      },
    );
    return response;
  }
}