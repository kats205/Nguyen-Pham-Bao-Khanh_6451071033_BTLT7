import 'package:btlt7/utils/appconstant.dart';
import 'package:http/http.dart' as http;

class TaskApiService {
  Future<http.Response> getAllTasks() async {
    Uri url = Uri.parse('${AppConstants.baseUrl}/tasks');
    return await http.get(url, headers: {'Accept': 'application/json'});
  }

  Future<http.Response> deleteTask(String id) async {
    Uri url = Uri.parse('${AppConstants.baseUrl}/tasks/$id');
    return await http.delete(url, headers: {'Accept': 'application/json'});
  }

  Future<http.Response> searchTasks(String keyword) async {
    Uri url = Uri.parse('${AppConstants.baseUrl}/tasks').replace(
      queryParameters: {'search': keyword},
    );
    return await http.get(url, headers: {'Accept': 'application/json'});
  }
}