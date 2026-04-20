import 'dart:convert';
import 'package:btlt7/data/models/user_profile.dart';

import '../services/user_profile_service.dart';

class UserProfileRepository {
  final UserProfileApiService service = UserProfileApiService();

  Future<UserProfileModel> fetchUserProfile(String id) async {
    try {
      final response = await service.getUserProfile(id);
      if (response.statusCode == 200) {
        dynamic itemJson = jsonDecode(response.body);
        return UserProfileModel.fromJson(itemJson);
      } else if (response.statusCode == 404) {
        throw Exception('User profile ID $id does not exist!');
      } else {
        throw Exception('Failed to load profile, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error Fetching User Profile: $e');
    }
  }

  Future<UserProfileModel> updateUserProfile(String id, UserProfileModel profile) async {
    try {
      String jsonBody = jsonEncode(profile.toJson());
      final response = await service.updateUserProfile(id, jsonBody);
      
      if (response.statusCode == 200) {
        dynamic itemJson = jsonDecode(response.body);
        return UserProfileModel.fromJson(itemJson);
      } else if (response.statusCode == 400) {
        throw Exception('Bad Request: Invalid update data.');
      } else {
        throw Exception('Failed to update profile, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error Updating User Profile: $e');
    }
  }
}