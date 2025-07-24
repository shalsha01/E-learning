import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageNotifier extends ChangeNotifier {
  static const _key = 'locale';
  Locale _locale = const Locale('en');

  LanguageNotifier() {
    _loadLocale();
  }

  Locale get locale => _locale;

  void toggleLocale() {
    _locale = _locale.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    _saveLocale();
    notifyListeners();
  }

  void setLanguage(Locale locale) {
    _locale = locale;
    _saveLocale();
    notifyListeners();
  }

  Future<void> _saveLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, _locale.languageCode);
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString(_key) ?? 'en';
    _locale = Locale(langCode);
    notifyListeners();
  }
}
