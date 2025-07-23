import 'package:e_learning_app/core/notifiers/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/notifiers/theme_notifier.dart';
import 'core/notifiers/language_notifier.dart';
import 'features/auth/providers/auth_notifier.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final container = ProviderContainer();
  // final isLoggedIn = await container.read(authNotifierProvider.notifier).checkLogin();
 // Get the instance of shared preferences
  final prefs = await SharedPreferences.getInstance();

  
  runApp(
    ProviderScope(
      overrides: [
        // Override the unimplemented provider with the value gotten from the plugin
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],

      child: MyApp(),
    ),
   
  );
}

class MyApp extends ConsumerWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final locale = ref.watch(languageNotifierProvider);
    final _appRouter = ref.read(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      locale: locale,
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: _appRouter.config(),
    );
  }
}
