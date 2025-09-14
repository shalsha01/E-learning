// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettingsState _$AppSettingsStateFromJson(Map<String, dynamic> json) =>
    _AppSettingsState(
      locale: json['locale'] as String?,
      theme: $enumDecodeNullable(_$ThemeModeEnumMap, json['theme']),
    );

Map<String, dynamic> _$AppSettingsStateToJson(_AppSettingsState instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'theme': _$ThemeModeEnumMap[instance.theme],
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appSettingsHash() => r'4a5236db43d38aa3a9b88802e57bf20ce103329f';

/// See also [AppSettings].
@ProviderFor(AppSettings)
final appSettingsProvider =
    AutoDisposeNotifierProvider<AppSettings, AppSettingsState>.internal(
  AppSettings.new,
  name: r'appSettingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppSettings = AutoDisposeNotifier<AppSettingsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
