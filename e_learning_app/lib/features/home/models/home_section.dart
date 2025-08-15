import 'package:freezed_annotation/freezed_annotation.dart';
import 'course_model.dart';
import 'mentor_model.dart';

part 'home_section.freezed.dart';

@freezed
class HomeSection with _$HomeSection {
  const factory HomeSection.header({

    required String greetingName, 
    required String subtitle,    

  }) = HeaderSection;

  const factory HomeSection.searchBar() = SearchBarSection;

  const factory HomeSection.banner({
    required String imageAsset, 
    required String title,
    required String subtitle,

  }) = BannerSection;

  const factory HomeSection.categories({
    required List<String> categories,
    required int selectedIndex,
    
  }) = CategoriesSection;

  const factory HomeSection.popularCourses({
    required List<Course> courses,
    required int selectedFilter, 
  }) = PopularCoursesSection;

  const factory HomeSection.topMentors({
    required List<Mentor> mentors,
  }) = TopMentorsSection;
}
