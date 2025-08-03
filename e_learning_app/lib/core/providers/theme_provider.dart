import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/core/notifiers/theme_notifier.dart';

final themeNotifierProvider = ChangeNotifierProvider<ThemeNotifier>((ref) {
  return ThemeNotifier();
});
