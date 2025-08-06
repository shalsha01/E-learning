part of 'auth_repository.dart';

class MockAuthRepository extends AuthRepository  {

  @override
   Future<UserModel> login(LoginRequest request) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(
      token: 'fake_token_123',
      email: request.email,
      name: 'Shahad',
    );
  }
  @override
  Future<UserModel> register(LoginRequest request) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(
      token: 'new_user_token_456',
      email: request.email,
      name: 'New User',
    );
  }
}