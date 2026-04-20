import 'package:btlt7/controllers/user_profile_controller.dart';
import 'package:btlt7/data/models/user_profile.dart';
import 'package:btlt7/views/ex4/profile_display_widget.dart';
import 'package:btlt7/views/ex4/profile_form_widget.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  final String userId; // Giả định id được truyền vào từ màn hình trước

  const UserProfileScreen({super.key, required this.userId});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final UserProfileController _controller = UserProfileController();

  @override
  void initState() {
    super.initState();
    // Khởi chạy lấy dữ liệu khi vừa vào màn hình
    _controller.loadProfile(widget.userId);
  }

  void _onUpdateSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cập nhật hồ sơ thành công!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Hồ sơ cá nhân - 6451071033'),
            actions: [
              // Biểu tượng bút chì để bật/tắt chế độ chỉnh sửa
              if (_controller.profile != null && !_controller.isLoading)
                IconButton(
                  icon: Icon(_controller.isEditing ? Icons.close : Icons.edit),
                  onPressed: () => _controller.toggleEditMode(),
                ),
            ],
          ),
          body: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    if (_controller.isLoading && _controller.profile == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_controller.errorMessage != null && _controller.profile == null) {
      return Center(
        child: Text(
          _controller.errorMessage!,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (_controller.profile != null) {
      return Column(
        children: [
          if (_controller.errorMessage != null)
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.red.shade100,
              width: double.infinity,
              child: Text(
                _controller.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          Expanded(
            child: _controller.isEditing
                ? ProfileFormWidget(
                    profile: _controller.profile!,
                    isLoading: _controller.isLoading,
                    onSubmit: (fullName, phone, email) async {
                      final updatedData = UserProfileModel(
                        id: _controller.profile!.id,
                        fullName: fullName,
                        phoneNumber: phone,
                        email: email,
                      );
                      bool success = await _controller.updateProfile(
                        widget.userId,
                        updatedData,
                      );
                      if (success) _onUpdateSuccess();
                    },
                  )
                : ProfileDisplayWidget(profile: _controller.profile!),
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}