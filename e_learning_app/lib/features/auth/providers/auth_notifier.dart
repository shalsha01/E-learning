import 'package:e_learning_app/features/auth/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/features/auth/models/login_request.dart';
import 'package:e_learning_app/features/auth/models/user_model.dart';
import 'package:e_learning_app/features/auth/repository/auth_repository.dart';
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


  Future<void> logout() async {
    await repository.logout();
    state = AuthInitial();
  }

  Future<bool> checkAutoLogin() async {
    final user = await repository.getUser();
    if (user != null) {
      state = AuthSuccess(user);
      return true;
    } else {
      state = AuthInitial();
      return false;
    }
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return AuthNotifier(repository);
});