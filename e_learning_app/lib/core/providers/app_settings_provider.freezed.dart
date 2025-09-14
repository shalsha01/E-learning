// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettingsState {
  String? get locale;
  ThemeMode? get theme;

  /// Create a copy of AppSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppSettingsStateCopyWith<AppSettingsState> get copyWith =>
      _$AppSettingsStateCopyWithImpl<AppSettingsState>(
          this as AppSettingsState, _$identity);

  /// Serializes this AppSettingsState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppSettingsState &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, locale, theme);

  @override
  String toString() {
    return 'AppSettingsState(locale: $locale, theme: $theme)';
  }
}

/// @nodoc
abstract mixin class $AppSettingsStateCopyWith<$Res> {
  factory $AppSettingsStateCopyWith(
          AppSettingsState value, $Res Function(AppSettingsState) _then) =
      _$AppSettingsStateCopyWithImpl;
  @useResult
  $Res call({String? locale, ThemeMode? theme});
}

/// @nodoc
class _$AppSettingsStateCopyWithImpl<$Res>
    implements $AppSettingsStateCopyWith<$Res> {
  _$AppSettingsStateCopyWithImpl(this._self, this._then);

  final AppSettingsState _self;
  final $Res Function(AppSettingsState) _then;

  /// Create a copy of AppSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? theme = freezed,
  }) {
    return _then(_self.copyWith(
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: freezed == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppSettingsState].
extension AppSettingsStatePatterns on AppSettingsState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppSettingsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppSettingsState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppSettingsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettingsState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppSettingsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettingsState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? locale, ThemeMode? theme)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppSettingsState() when $default != null:
        return $default(_that.locale, _that.theme);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? locale, ThemeMode? theme) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettingsState():
        return $default(_that.locale, _that.theme);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? locale, ThemeMode? theme)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettingsState() when $default != null:
        return $default(_that.locale, _that.theme);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AppSettingsState extends AppSettingsState {
  const _AppSettingsState({this.locale, this.theme}) : super._();
  factory _AppSettingsState.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsStateFromJson(json);

  @override
  final String? locale;
  @override
  final ThemeMode? theme;

  /// Create a copy of AppSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppSettingsStateCopyWith<_AppSettingsState> get copyWith =>
      __$AppSettingsStateCopyWithImpl<_AppSettingsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppSettingsStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppSettingsState &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, locale, theme);

  @override
  String toString() {
    return 'AppSettingsState(locale: $locale, theme: $theme)';
  }
}

/// @nodoc
abstract mixin class _$AppSettingsStateCopyWith<$Res>
    implements $AppSettingsStateCopyWith<$Res> {
  factory _$AppSettingsStateCopyWith(
          _AppSettingsState value, $Res Function(_AppSettingsState) _then) =
      __$AppSettingsStateCopyWithImpl;
  @override
  @useResult
  $Res call({String? locale, ThemeMode? theme});
}

/// @nodoc
class __$AppSettingsStateCopyWithImpl<$Res>
    implements _$AppSettingsStateCopyWith<$Res> {
  __$AppSettingsStateCopyWithImpl(this._self, this._then);

  final _AppSettingsState _self;
  final $Res Function(_AppSettingsState) _then;

  /// Create a copy of AppSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locale = freezed,
    Object? theme = freezed,
  }) {
    return _then(_AppSettingsState(
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: freezed == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
    ));
  }
}

// dart format on
