import 'package:btlt7/controllers/task_controller.dart';
import 'package:btlt7/views/ex5_6/task_item_widget.dart';
import 'package:btlt7/views/ex5_6/task_search_bar_widget.dart';
import 'package:flutter/material.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TaskController _controller = TaskController();

  @override
  void initState() {
    super.initState();
    _controller.loadTasks(); // Load toàn bộ data ban đầu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý & Tìm kiếm Task - 6451071033'),
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, child) {
          return Column(
            children: [
              // 1. Thanh tìm kiếm nằm trên cùng
              TaskSearchBarWidget(
                isLoading: _controller.isLoading,
                onSearch: (keyword) => _controller.searchTasks(keyword),
              ),
              
              // 2. Hiển thị Lỗi (nếu có)
              if (_controller.errorMessage != null && !_controller.isLoading)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _controller.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              // 3. Hiển thị Loading hoặc Danh sách
              Expanded(
                child: _buildListContent(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListContent() {
    // Trạng thái đang tải API search hoặc lấy toàn bộ
    if (_controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Trạng thái không có dữ liệu
    if (_controller.tasks.isEmpty) {
      return const Center(child: Text('Không tìm thấy công việc nào.'));
    }

    // Trạng thái có dữ liệu
    return RefreshIndicator(
      onRefresh: _controller.loadTasks,
      child: ListView.builder(
        itemCount: _controller.tasks.length,
        itemBuilder: (context, index) {
          final task = _controller.tasks[index];
          return TaskItemWidget(
            task: task,
            onDelete: () async {
              if (task.id != null) {
                // Tái sử dụng hàm xóa của bài trước
                bool success = await _controller.deleteTask(task.id!);
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đã xóa: ${task.title}')),
                  );
                }
              }
            },
          );
        },
      ),
    );
  }
}