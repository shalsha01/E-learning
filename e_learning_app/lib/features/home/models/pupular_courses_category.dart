import 'package:freezed_annotation/freezed_annotation.dart';

part 'pupular_courses_category.freezed.dart';
part 'pupular_courses_category.g.dart';

@freezed
abstract class PupularCoursesCategory with _$PupularCoursesCategory {
  const factory PupularCoursesCategory({
  required  int id,
    required String title,
  }) = _PupularCoursesCategory;

  factory PupularCoursesCategory.fromJson(Map<String, dynamic> json) => _$PupularCoursesCategoryFromJson(json);
}
