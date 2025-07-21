import 'dart:async';
import '../models/login_request.dart';
import '../models/user_model.dart';

class AuthRepository {
  Future<UserModel> login(LoginRequest request) async {
    await Future.delayed(const Duration(seconds: 2)); 
    
    if (request.email == 'test@test.com' && request.password == '123456') {
      return UserModel(token: 'abc123', email: request.email, name: 'Test User');
    } else {
      throw Exception('Invalid credentials');
    }
  }
}
