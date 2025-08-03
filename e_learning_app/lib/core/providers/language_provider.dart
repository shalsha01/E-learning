import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/core/notifiers/language_notifier.dart';

final languageNotifierProvider = ChangeNotifierProvider<LanguageNotifier>((ref) {
  return LanguageNotifier();
});
