import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifiers/language_notifier.dart';

final languageNotifierProvider = ChangeNotifierProvider<LanguageNotifier>((ref) {
  return LanguageNotifier();
});
