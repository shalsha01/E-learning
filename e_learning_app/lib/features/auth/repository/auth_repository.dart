import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthRepository {
  Future<UserModel> login(String email, String password) async {

    await Future.delayed(const Duration(seconds: 2));
  
    return UserModel(
      token: 'fake_token_123',
      email: email,
      name: 'Shahad',
    );
  }

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', user.token);
    await prefs.setString('email', user.email);
    await prefs.setString('name', user.name);
  }

  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final email = prefs.getString('email');
    final name = prefs.getString('name');

    if (token != null && email != null && name != null) {
      return UserModel(token: token, email: email, name: name);
    }
    return null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
