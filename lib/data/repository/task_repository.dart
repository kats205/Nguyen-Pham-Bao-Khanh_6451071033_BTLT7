import 'dart:convert';
import 'package:btlt7/data/models/task.dart';

import '../services/task_service.dart';

class TaskRepository {
  final TaskApiService service = TaskApiService();

  Future<List<TaskModel>> fetchAllTasks() async {
    try {
      final response = await service.getAllTasks();
      if (response.statusCode == 200) {
        List<dynamic> listJson = jsonDecode(response.body);
        return listJson.map((json) => TaskModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load tasks, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error Fetching Tasks: $e');
    }
  }

  Future<void> removeTask(String id) async {
    try {
      final response = await service.deleteTask(id);
      // Xóa thành công thường trả về 200 (OK) hoặc 204 (No Content)
      if (response.statusCode == 200 || response.statusCode == 204) {
        return; 
      } else if (response.statusCode == 404) {
        throw Exception('Task ID $id does not exist!');
      } else {
        throw Exception('Failed to delete task, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error Deleting Task: $e');
    }
  }
  Future<List<TaskModel>> searchTasks(String keyword) async {
    try {
      final response = await service.searchTasks(keyword);
      if (response.statusCode == 200) {
        List<dynamic> listJson = jsonDecode(response.body);
        return listJson.map((json) => TaskModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search tasks, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error Searching Tasks: $e');
    }
  }
}