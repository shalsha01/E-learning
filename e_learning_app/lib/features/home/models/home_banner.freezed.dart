// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_banner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeBanner {
  String? get image;
  String get title;
  String get subtitle;

  /// Create a copy of HomeBanner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeBannerCopyWith<HomeBanner> get copyWith =>
      _$HomeBannerCopyWithImpl<HomeBanner>(this as HomeBanner, _$identity);

  /// Serializes this HomeBanner to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeBanner &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, image, title, subtitle);

  @override
  String toString() {
    return 'HomeBanner(image: $image, title: $title, subtitle: $subtitle)';
  }
}

/// @nodoc
abstract mixin class $HomeBannerCopyWith<$Res> {
  factory $HomeBannerCopyWith(
          HomeBanner value, $Res Function(HomeBanner) _then) =
      _$HomeBannerCopyWithImpl;
  @useResult
  $Res call({String? image, String title, String subtitle});
}

/// @nodoc
class _$HomeBannerCopyWithImpl<$Res> implements $HomeBannerCopyWith<$Res> {
  _$HomeBannerCopyWithImpl(this._self, this._then);

  final HomeBanner _self;
  final $Res Function(HomeBanner) _then;

  /// Create a copy of HomeBanner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? title = null,
    Object? subtitle = null,
  }) {
    return _then(_self.copyWith(
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeBanner].
extension HomeBannerPatterns on HomeBanner {
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
    TResult Function(_HomeBanner value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeBanner() when $default != null:
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
    TResult Function(_HomeBanner value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeBanner():
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
    TResult? Function(_HomeBanner value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeBanner() when $default != null:
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
    TResult Function(String? image, String title, String subtitle)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeBanner() when $default != null:
        return $default(_that.image, _that.title, _that.subtitle);
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
    TResult Function(String? image, String title, String subtitle) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeBanner():
        return $default(_that.image, _that.title, _that.subtitle);
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
    TResult? Function(String? image, String title, String subtitle)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeBanner() when $default != null:
        return $default(_that.image, _that.title, _that.subtitle);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeBanner implements HomeBanner {
  const _HomeBanner({this.image, required this.title, required this.subtitle});
  factory _HomeBanner.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerFromJson(json);

  @override
  final String? image;
  @override
  final String title;
  @override
  final String subtitle;

  /// Create a copy of HomeBanner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeBannerCopyWith<_HomeBanner> get copyWith =>
      __$HomeBannerCopyWithImpl<_HomeBanner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeBannerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeBanner &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, image, title, subtitle);

  @override
  String toString() {
    return 'HomeBanner(image: $image, title: $title, subtitle: $subtitle)';
  }
}

/// @nodoc
abstract mixin class _$HomeBannerCopyWith<$Res>
    implements $HomeBannerCopyWith<$Res> {
  factory _$HomeBannerCopyWith(
          _HomeBanner value, $Res Function(_HomeBanner) _then) =
      __$HomeBannerCopyWithImpl;
  @override
  @useResult
  $Res call({String? image, String title, String subtitle});
}

/// @nodoc
class __$HomeBannerCopyWithImpl<$Res> implements _$HomeBannerCopyWith<$Res> {
  __$HomeBannerCopyWithImpl(this._self, this._then);

  final _HomeBanner _self;
  final $Res Function(_HomeBanner) _then;

  /// Create a copy of HomeBanner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? image = freezed,
    Object? title = null,
    Object? subtitle = null,
  }) {
    return _then(_HomeBanner(
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
