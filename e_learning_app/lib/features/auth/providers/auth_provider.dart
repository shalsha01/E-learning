import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/features/auth/models/user_model.dart';
import 'package:e_learning_app/features/auth/repository/auth_repository.dart';
import 'auth_notifier.dart';
import 'auth_state.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return AuthNotifier(repository);
});
