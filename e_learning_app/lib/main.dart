import 'package:e_learning_app/app.dart';
import 'package:e_learning_app/features/auth/providers/shared_preferences_provider.dart';
import 'package:e_learning_app/features/auth/data/repository/auth_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Message handled in the background: ${message.messageId}');
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
