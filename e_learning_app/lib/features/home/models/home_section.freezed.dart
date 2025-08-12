// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeSection {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeSection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeSection()';
  }
}

/// @nodoc
class $HomeSectionCopyWith<$Res> {
  $HomeSectionCopyWith(HomeSection _, $Res Function(HomeSection) __);
}

/// Adds pattern-matching-related methods to [HomeSection].
extension HomeSectionPatterns on HomeSection {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BannerSection value)? banner,
    TResult Function(CategoriesSection value)? categories,
    TResult Function(PopularCoursesSection value)? popularCourses,
    TResult Function(TopMentorsSection value)? topMentors,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BannerSection() when banner != null:
        return banner(_that);
      case CategoriesSection() when categories != null:
        return categories(_that);
      case PopularCoursesSection() when popularCourses != null:
        return popularCourses(_that);
      case TopMentorsSection() when topMentors != null:
        return topMentors(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(BannerSection value) banner,
    required TResult Function(CategoriesSection value) categories,
    required TResult Function(PopularCoursesSection value) popularCourses,
    required TResult Function(TopMentorsSection value) topMentors,
  }) {
    final _that = this;
    switch (_that) {
      case BannerSection():
        return banner(_that);
      case CategoriesSection():
        return categories(_that);
      case PopularCoursesSection():
        return popularCourses(_that);
      case TopMentorsSection():
        return topMentors(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BannerSection value)? banner,
    TResult? Function(CategoriesSection value)? categories,
    TResult? Function(PopularCoursesSection value)? popularCourses,
    TResult? Function(TopMentorsSection value)? topMentors,
  }) {
    final _that = this;
    switch (_that) {
      case BannerSection() when banner != null:
        return banner(_that);
      case CategoriesSection() when categories != null:
        return categories(_that);
      case PopularCoursesSection() when popularCourses != null:
        return popularCourses(_that);
      case TopMentorsSection() when topMentors != null:
        return topMentors(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imageUrl, String title, String subtitle)? banner,
    TResult Function(List<String> categories, int selectedIndex)? categories,
    TResult Function(List<Course> courses)? popularCourses,
    TResult Function(List<Mentor> mentors)? topMentors,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BannerSection() when banner != null:
        return banner(_that.imageUrl, _that.title, _that.subtitle);
      case CategoriesSection() when categories != null:
        return categories(_that.categories, _that.selectedIndex);
      case PopularCoursesSection() when popularCourses != null:
        return popularCourses(_that.courses);
      case TopMentorsSection() when topMentors != null:
        return topMentors(_that.mentors);
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
  TResult when<TResult extends Object?>({
    required TResult Function(String imageUrl, String title, String subtitle)
        banner,
    required TResult Function(List<String> categories, int selectedIndex)
        categories,
    required TResult Function(List<Course> courses) popularCourses,
    required TResult Function(List<Mentor> mentors) topMentors,
  }) {
    final _that = this;
    switch (_that) {
      case BannerSection():
        return banner(_that.imageUrl, _that.title, _that.subtitle);
      case CategoriesSection():
        return categories(_that.categories, _that.selectedIndex);
      case PopularCoursesSection():
        return popularCourses(_that.courses);
      case TopMentorsSection():
        return topMentors(_that.mentors);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String imageUrl, String title, String subtitle)? banner,
    TResult? Function(List<String> categories, int selectedIndex)? categories,
    TResult? Function(List<Course> courses)? popularCourses,
    TResult? Function(List<Mentor> mentors)? topMentors,
  }) {
    final _that = this;
    switch (_that) {
      case BannerSection() when banner != null:
        return banner(_that.imageUrl, _that.title, _that.subtitle);
      case CategoriesSection() when categories != null:
        return categories(_that.categories, _that.selectedIndex);
      case PopularCoursesSection() when popularCourses != null:
        return popularCourses(_that.courses);
      case TopMentorsSection() when topMentors != null:
        return topMentors(_that.mentors);
      case _:
        return null;
    }
  }
}

/// @nodoc

class BannerSection implements HomeSection {
  const BannerSection(
      {required this.imageUrl, required this.title, required this.subtitle});

  final String imageUrl;
  final String title;
  final String subtitle;

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BannerSectionCopyWith<BannerSection> get copyWith =>
      _$BannerSectionCopyWithImpl<BannerSection>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BannerSection &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, title, subtitle);

  @override
  String toString() {
    return 'HomeSection.banner(imageUrl: $imageUrl, title: $title, subtitle: $subtitle)';
  }
}

/// @nodoc
abstract mixin class $BannerSectionCopyWith<$Res>
    implements $HomeSectionCopyWith<$Res> {
  factory $BannerSectionCopyWith(
          BannerSection value, $Res Function(BannerSection) _then) =
      _$BannerSectionCopyWithImpl;
  @useResult
  $Res call({String imageUrl, String title, String subtitle});
}

/// @nodoc
class _$BannerSectionCopyWithImpl<$Res>
    implements $BannerSectionCopyWith<$Res> {
  _$BannerSectionCopyWithImpl(this._self, this._then);

  final BannerSection _self;
  final $Res Function(BannerSection) _then;

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageUrl = null,
    Object? title = null,
    Object? subtitle = null,
  }) {
    return _then(BannerSection(
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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

/// @nodoc

class CategoriesSection implements HomeSection {
  const CategoriesSection(
      {required final List<String> categories, required this.selectedIndex})
      : _categories = categories;

  final List<String> _categories;
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final int selectedIndex;

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesSectionCopyWith<CategoriesSection> get copyWith =>
      _$CategoriesSectionCopyWithImpl<CategoriesSection>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesSection &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_categories), selectedIndex);

  @override
  String toString() {
    return 'HomeSection.categories(categories: $categories, selectedIndex: $selectedIndex)';
  }
}

/// @nodoc
abstract mixin class $CategoriesSectionCopyWith<$Res>
    implements $HomeSectionCopyWith<$Res> {
  factory $CategoriesSectionCopyWith(
          CategoriesSection value, $Res Function(CategoriesSection) _then) =
      _$CategoriesSectionCopyWithImpl;
  @useResult
  $Res call({List<String> categories, int selectedIndex});
}

/// @nodoc
class _$CategoriesSectionCopyWithImpl<$Res>
    implements $CategoriesSectionCopyWith<$Res> {
  _$CategoriesSectionCopyWithImpl(this._self, this._then);

  final CategoriesSection _self;
  final $Res Function(CategoriesSection) _then;

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categories = null,
    Object? selectedIndex = null,
  }) {
    return _then(CategoriesSection(
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedIndex: null == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class PopularCoursesSection implements HomeSection {
  const PopularCoursesSection({required final List<Course> courses})
      : _courses = courses;

  final List<Course> _courses;
  List<Course> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PopularCoursesSectionCopyWith<PopularCoursesSection> get copyWith =>
      _$PopularCoursesSectionCopyWithImpl<PopularCoursesSection>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PopularCoursesSection &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courses));

  @override
  String toString() {
    return 'HomeSection.popularCourses(courses: $courses)';
  }
}

/// @nodoc
abstract mixin class $PopularCoursesSectionCopyWith<$Res>
    implements $HomeSectionCopyWith<$Res> {
  factory $PopularCoursesSectionCopyWith(PopularCoursesSection value,
          $Res Function(PopularCoursesSection) _then) =
      _$PopularCoursesSectionCopyWithImpl;
  @useResult
  $Res call({List<Course> courses});
}

/// @nodoc
class _$PopularCoursesSectionCopyWithImpl<$Res>
    implements $PopularCoursesSectionCopyWith<$Res> {
  _$PopularCoursesSectionCopyWithImpl(this._self, this._then);

  final PopularCoursesSection _self;
  final $Res Function(PopularCoursesSection) _then;

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courses = null,
  }) {
    return _then(PopularCoursesSection(
      courses: null == courses
          ? _self._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<Course>,
    ));
  }
}

/// @nodoc

class TopMentorsSection implements HomeSection {
  const TopMentorsSection({required final List<Mentor> mentors})
      : _mentors = mentors;

  final List<Mentor> _mentors;
  List<Mentor> get mentors {
    if (_mentors is EqualUnmodifiableListView) return _mentors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mentors);
  }

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TopMentorsSectionCopyWith<TopMentorsSection> get copyWith =>
      _$TopMentorsSectionCopyWithImpl<TopMentorsSection>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TopMentorsSection &&
            const DeepCollectionEquality().equals(other._mentors, _mentors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_mentors));

  @override
  String toString() {
    return 'HomeSection.topMentors(mentors: $mentors)';
  }
}

/// @nodoc
abstract mixin class $TopMentorsSectionCopyWith<$Res>
    implements $HomeSectionCopyWith<$Res> {
  factory $TopMentorsSectionCopyWith(
          TopMentorsSection value, $Res Function(TopMentorsSection) _then) =
      _$TopMentorsSectionCopyWithImpl;
  @useResult
  $Res call({List<Mentor> mentors});
}

/// @nodoc
class _$TopMentorsSectionCopyWithImpl<$Res>
    implements $TopMentorsSectionCopyWith<$Res> {
  _$TopMentorsSectionCopyWithImpl(this._self, this._then);

  final TopMentorsSection _self;
  final $Res Function(TopMentorsSection) _then;

  /// Create a copy of HomeSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mentors = null,
  }) {
    return _then(TopMentorsSection(
      mentors: null == mentors
          ? _self._mentors
          : mentors // ignore: cast_nullable_to_non_nullable
              as List<Mentor>,
    ));
  }
}

// dart format on
