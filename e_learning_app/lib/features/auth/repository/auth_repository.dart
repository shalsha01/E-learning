import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_learning_app/features/auth/models/user_model.dart';
import 'package:e_learning_app/features/auth/models/login_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository {
  static const String _userKey = 'auth_user';

  Future<UserModel> login(LoginRequest request) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(
      token: 'fake_token_123',
      email: request.email,
      name: 'Shahad',
    );
  }

  Future<UserModel> register(LoginRequest request) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(
      token: 'new_user_token_456',
      email: request.email,
      name: 'New User',
    );
  }

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }


  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString);
      return UserModel.fromJson(jsonMap);
    }
    return null;
  }


  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
