import 'package:btlt7/controllers/create_post_controller.dart';
import 'package:btlt7/views/ex3/post_form_widget.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final CreatePostController _controller = CreatePostController();

  void _onPostCreated(bool isSuccess) {
    if (isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post created successfully'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context); // Trở về màn hình trước sau khi tạo thành công
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo bài viết mới - 6451071033'),
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Hiển thị lỗi nếu có từ Controller
                if (_controller.errorMessage != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(8),
                    color: Colors.red.shade100,
                    child: Text(
                      _controller.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                
                // Form nhập liệu đã được tách riêng
                Expanded(
                  child: PostFormWidget(
                    isLoading: _controller.isLoading,
                    onSubmit: (title, picture) async {
                      bool success = await _controller.submitPost(
                        title: title,
                        picture: picture,
                      );
                      _onPostCreated(success);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}