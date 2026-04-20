import 'package:btlt7/utils/appconstant.dart';
import 'package:http/http.dart' as http;

class ProductApiService{
  Future<http.Response> getProductById(String id) async {
    Uri url = Uri.parse('${AppConstants.baseUrl}/products/$id');

    http.Response response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
      },
    );
    return response;
  }
}