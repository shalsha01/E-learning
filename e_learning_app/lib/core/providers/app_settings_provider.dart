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

  Locale get getLocale => locale != null
      ? Locale(locale!)
      : const Locale('en');
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
        return AppSettingsState();
      }
    }
    return AppSettingsState();
  }

  Future<void> updateLocale(String? locale) async {
    state = state.copyWith(locale: locale);
    await updateSettings();
  }

  Future<void> updateTheme(ThemeMode? theme) async {
    state = state.copyWith(theme: theme);
    await updateSettings();
  }

  Future<void> updateSettings() async {
    final json = state.toJson();
    await pref.setString(PrefsKeys.appSettings, jsonEncode(json));
  }
}
