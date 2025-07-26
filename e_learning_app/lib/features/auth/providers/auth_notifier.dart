import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_request.dart';
import '../models/user_model.dart';
import '../repository/auth_repository.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository repository;

  AuthNotifier(this.repository) : super(AuthInitial());

 
  Future<UserModel> login(LoginRequest request) async {
    state = AuthLoading();
    try {
      final user = await repository.login(request); 
      await repository.saveUser(user); 
      state = AuthSuccess(user);
      return user;
    } catch (e) {
      state = AuthError(e.toString());
      rethrow;
    }
  }


  Future<UserModel> register(LoginRequest request) async {
    state = AuthLoading();
    try {
   
      final user = await repository.login(request); 
      await repository.saveUser(user);
      state = AuthSuccess(user);
      return user;
    } catch (e) {
      state = AuthError(e.toString());
      rethrow;
    }
  }


  Future<bool> checkLogin() async {
    final user = await repository.getUser();
    if (user != null) {
      state = AuthSuccess(user);
      return true;
    } else {
      state = AuthInitial();
      return false;
    }
  }


  Future<void> logout() async {
    await repository.logout();
    state = AuthInitial();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return AuthNotifier(repository);
});
