import 'package:btlt7/data/models/task.dart';
import 'package:flutter/material.dart';
import '../data/repository/task_repository.dart';

class TaskController extends ChangeNotifier {
  final TaskRepository repository = TaskRepository();
  
  List<TaskModel> tasks = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadTasks() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      tasks = await repository.fetchAllTasks();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deleteTask(String id) async {
    try {
      await repository.removeTask(id);
      tasks.removeWhere((task) => task.id == id);
      notifyListeners();
      return true; // Báo UI hiện Toast thành công
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
      return false; // Báo UI hiện Toast thất bại
    }
  }

  Future<void> searchTasks(String keyword) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners(); // Báo UI hiển thị loading

    try {
      if (keyword.trim().isEmpty) {
        tasks = await repository.fetchAllTasks();
      } else {
        tasks = await repository.searchTasks(keyword.trim());
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners(); // Báo UI render lại danh sách mới
    }
  }
}