import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.token);
      await prefs.setString('email', user.email);
      await prefs.setString('name', user.name);

      state = AuthSuccess(user);
    } catch (e) {
      state = AuthError(e.toString());
    }
  }

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final email = prefs.getString('email');
    final name = prefs.getString('name');

    if (token != null && email != null && name != null) {
      state = AuthSuccess(UserModel(token: token, email: email, name: name));
    } else {
      state = AuthInitial();
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

