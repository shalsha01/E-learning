import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/features/auth/providers/auth_notifier.dart';
import '../models/login_request.dart';

final loginControllerProvider = Provider.autoDispose<LoginController>((ref) {
  return LoginController(ref);
});

class LoginController {
  final Ref ref;
  LoginController(this.ref);

  Future<void> login(String email, String password) async {
    final request = LoginRequest(email: email, password: password);
    await ref.read(authNotifierProvider.notifier).login(request);
  }
}
