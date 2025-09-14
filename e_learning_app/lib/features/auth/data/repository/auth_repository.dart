import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_learning_app/features/auth/data/models/user_model.dart';
import 'package:e_learning_app/features/auth/data/models/login_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'auth_repository.mock.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository extends StateNotifier<AsyncValue<void>> {
  AuthRepository() : super(const AsyncData(null));
  static const String _userKey = 'user';

  Future<UserModel> login(LoginRequest request) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError('Login method not implemented');

  }

  Future<UserModel> register(LoginRequest request) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError('Register method not implemented');
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
