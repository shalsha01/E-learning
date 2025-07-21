import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageNotifierProvider = StateNotifierProvider<LanguageNotifier, Locale>(
  (ref) => LanguageNotifier(),
);

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(const Locale('en'));

  void setLanguage(Locale locale) {
    state = locale;
  }

  String get currentLanguageCode => state.languageCode;
}
