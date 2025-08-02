import 'package:e_learning_app/features/auth/models/login_request.dart';
import 'package:e_learning_app/features/auth/models/user_model.dart';
import 'package:e_learning_app/features/auth/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  AuthRepository get _repository => ref.read(authRepositoryProvider);

  @override
  FutureOr<UserModel?> build() async {
  
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
