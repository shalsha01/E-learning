import 'package:e_learning_app/features/home/models/course_model.dart';
import 'package:e_learning_app/features/home/models/mentor_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_section.freezed.dart';

@freezed
class HomeSection with _$HomeSection {
  const factory HomeSection.banner({
    required String imageUrl,
    required String title,
    required String subtitle,
  }) = BannerSection;

  const factory HomeSection.categories({
    required List<String> categories,
    required int selectedIndex,
  }) = CategoriesSection;

  const factory HomeSection.popularCourses({
    required List<Course> courses,
  }) = PopularCoursesSection;

  const factory HomeSection.topMentors({
    required List<Mentor> mentors,
  }) = TopMentorsSection;
}
