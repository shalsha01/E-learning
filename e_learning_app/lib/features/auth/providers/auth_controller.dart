import 'package:e_learning_app/features/auth/models/login_request.dart';
import 'package:e_learning_app/features/auth/models/user_model.dart';
import 'package:e_learning_app/features/auth/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  late final AuthRepository _repository;

  @override
  FutureOr<UserModel?> build() async {
    _repository = ref.read(authRepositoryProvider);

    // Check if user exists in cache
    final cachedUser = await _repository.getUser();
    return cachedUser;
  }

  Future<UserModel> login(LoginRequest request) async {
    final user = await _repository.login(request);
    await _repository.saveUser(user);
    state = AsyncData(user);
    return user;
  }

  Future<UserModel> register(LoginRequest request) async {
    final user = await _repository.register(request);
    await _repository.saveUser(user);
    state = AsyncData(user);
    return user;
  }

  Future<void> logout() async {
    await _repository.logout();
    state = const AsyncData(null);
  }
}
