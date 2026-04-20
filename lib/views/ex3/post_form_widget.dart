import 'package:flutter/material.dart';

class PostFormWidget extends StatefulWidget {
  final bool isLoading;
  final Function(String title, String? picture) onSubmit;

  const PostFormWidget({
    super.key,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  State<PostFormWidget> createState() => _PostFormWidgetState();
}

class _PostFormWidgetState extends State<PostFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _pictureController = TextEditingController();

  void _submit() {
    // Validate Frontend
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(
        _titleController.text.trim(),
        _pictureController.text.trim().isEmpty ? null : _pictureController.text.trim(),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _pictureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Tiêu đề bài viết (*)',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.title),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Vui lòng nhập tiêu đề bài viết';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _pictureController,
            decoration: const InputDecoration(
              labelText: 'Đường dẫn hình ảnh (Tùy chọn)',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.image),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: widget.isLoading ? null : _submit,
              child: widget.isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Đăng bài'),
            ),
          ),
        ],
      ),
    );
  }
}