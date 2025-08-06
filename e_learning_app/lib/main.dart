import 'package:e_learning_app/app.dart';
import 'package:e_learning_app/features/auth/providers/shared_preferences_provider.dart';
import 'package:e_learning_app/features/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final overrides = await getOverrides();

  runApp(
    ProviderScope(
      overrides: overrides,
      child: MainApp(),
    ),
  );
}

Future<List<Override>> getOverrides() async {
  final pref = await SharedPreferences.getInstance();
  return [
    sharedPreferencesProvider.overrideWithValue(pref),
    authRepositoryProvider.overrideWithValue(MockAuthRepository()),
  ];
}
