import 'package:btlt7/data/models/user_profile.dart';
import 'package:flutter/material.dart';
import '../data/repository/user_profile_repository.dart';

class UserProfileController extends ChangeNotifier {
  final UserProfileRepository repository = UserProfileRepository();
  UserProfileModel? profile;
  
  bool isLoading = false;
  bool isEditing = false;
  String? errorMessage;

  Future<void> loadProfile(String id) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      profile = await repository.fetchUserProfile(id);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void toggleEditMode() {
    isEditing = !isEditing;
    errorMessage = null;
    notifyListeners();
  }

  Future<bool> updateProfile(String id, UserProfileModel updatedData) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await repository.updateUserProfile(id, updatedData);
      isEditing = false; 
      // Gọi lại loadProfile để đảm bảo dữ liệu hiển thị là dữ liệu mới nhất từ server
      await loadProfile(id); 
      return true;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}