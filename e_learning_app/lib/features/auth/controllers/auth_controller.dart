import 'dart:convert';
import 'package:e_learning_app/features/auth/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<UserModel?>>(
  (ref) => AuthController()..loadUserFromCache(),
);

class AuthController extends StateNotifier<AsyncValue<UserModel?>> {
  AuthController() : super(const AsyncValue.data(null));

  static const String _userKey = 'auth_user';

  // Load user from SharedPreferences on app start
  Future<void> loadUserFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString != null) {
      try {
        final jsonMap = jsonDecode(jsonString);
        final user = UserModel.fromJson(jsonMap);
        state = AsyncValue.data(user);
      } catch (_) {
        state = const AsyncValue.data(null);
      }
    }
  }

  // Save user to cache
  Future<void> _cacheUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  // Clear user from cache
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    state = const AsyncValue.data(null);
  }

  // Simulated login (replace with actual API call)
  Future<void> login({
    required String email,
    required String password,
    bool remember = false,
  }) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay

    try {
      final user = UserModel(
        token: 'token_abc123',
        email: email,
        name: 'Test User',
      );

      if (remember) await _cacheUser(user);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // Simulated register (replace with actual API call)
  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay

    try {
      final user = UserModel(
        token: 'token_xyz456',
        email: email,
        name: name,
      );

      await _cacheUser(user);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
