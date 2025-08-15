import 'dart:convert';
import 'package:e_learning_app/core/constants/prefs_keys.dart';
import 'package:e_learning_app/features/auth/providers/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_settings_provider.freezed.dart';
part 'app_settings_provider.g.dart';

@freezed
abstract class AppSettingsState with _$AppSettingsState {
  const AppSettingsState._();
  const factory AppSettingsState({
    String? locale,
    ThemeMode? theme,
  }) = _AppSettingsState;

  factory AppSettingsState.fromJson(Map<String, Object?> json) =>
      _$AppSettingsStateFromJson(json);

  Locale get getLocale => locale != null ? Locale(locale!) : const Locale('en');
}

@riverpod
class AppSettings extends _$AppSettings {
  SharedPreferences get pref => ref.read(sharedPreferencesProvider);

  @override
  AppSettingsState build() {
    final appSettings = pref.getString(PrefsKeys.appSettings);
    if (appSettings != null) {
      final json = jsonDecode(appSettings) as Map<String, dynamic>;
      try {
        return AppSettingsState.fromJson(json);
      } catch (e) {
        return const AppSettingsState();
      }
    }
    return const AppSettingsState();
  }

  Future<void> updateLocale(String? locale) async {
    state = state.copyWith(locale: locale);
    await _updateSettings();
  }

  Future<void> updateTheme(ThemeMode? theme) async {
    state = state.copyWith(theme: theme);
    await _updateSettings();
  }

  Future<void> _updateSettings() async {
    final json = state.toJson();
    await pref.setString(PrefsKeys.appSettings, jsonEncode(json));
  }

  void toggleTheme() {
    final isDark = state.theme == ThemeMode.dark;
    updateTheme(isDark ? ThemeMode.light : ThemeMode.dark);
  }

  bool get isDark => state.theme == ThemeMode.dark;
}
