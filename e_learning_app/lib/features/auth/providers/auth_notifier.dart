import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cache/riverpod_cache.dart';
import '../models/login_request.dart';
import '../models/user_model.dart';
import '../repository/auth_repository.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository repository;

  AuthNotifier(this.repository) : super(AuthInitial());

  Future<void> login(LoginRequest request) async {
    state = AuthLoading();
    try {
      final user = await repository.login(request);
      await Cache.instance.write('token', user.token);
      await Cache.instance.write('email', user.email);
      await Cache.instance.write('name', user.name);
      state = AuthSuccess(user);
    } catch (e) {
      state = AuthError(e.toString());
    }
  }

  Future<void> register(LoginRequest request) async {
    state = AuthLoading();
    try {
      // For demo, use the same repository.login (replace with repository.register if available)
      final user = await repository.login(request);
      await Cache.instance.write('token', user.token);
      await Cache.instance.write('email', user.email);
      await Cache.instance.write('name', user.name);
      state = AuthSuccess(user);
    } catch (e) {
      state = AuthError(e.toString());
    }
  }

  Future<bool> checkLogin() async {
    final token = await Cache.instance.read('token');
    final email = await Cache.instance.read('email');
    final name = await Cache.instance.read('name');
    if (token != null && email != null && name != null) {
      state = AuthSuccess(UserModel(token: token, email: email, name: name));
      return true;
    } else {
      state = AuthInitial();
      return false;
    }
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
