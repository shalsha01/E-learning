import 'dart:async';
import 'package:e_learning_app/features/home/models/home_section.dart';
import 'package:e_learning_app/features/home/models/course_model.dart';
import 'package:e_learning_app/features/home/models/mentor_model.dart';

class HomeRepository {
  Future<List<HomeSection>> fetchHomeSections() async {
    // simulating API
    await Future.delayed(const Duration(milliseconds: 700));

    final categories = ['All', 'Graphic Design', '3D Design', 'Arts & Humanities'];

    final courses = <Course>[
      Course(
        title: 'Graphic Design Advanced',
        category: 'Graphic Design',
        price: '\$28',
        rating: 4.2,
        studentsCount: 7830,
        imageUrl: 'assets/images/Graphic_Design.png', // local asset
      ),
      Course(
        title: 'Advertisment Design',
        category: 'Graphic Design',
        price: '\$42',
        rating: 4.5,
        studentsCount: 6520,
        imageUrl: 'assets/images/Graphic_Design.png',
      ),
    ];

    final mentors = <Mentor>[
      Mentor(name: 'Sonja', imageUrl: 'assets/images/mentor_1.png'),
      Mentor(name: 'Jensen', imageUrl: 'assets/images/mentor_2.png'),
      Mentor(name: 'Victoria', imageUrl: 'assets/images/mentor_3.png'),
      Mentor(name: 'Castaldo', imageUrl: 'assets/images/mentor_4.png'),
    ];

    return [
      HomeSection.header(
        greetingName: 'Ronald A. Martin',
        subtitle: 'What Would you like to learn Today?', // TODO l10n
      ),
      const HomeSection.searchBar(),
      HomeSection.banner(
        imageAsset: 'assets/images/home_banner.svg',
        title: "25% OFF* Today’s Special",               
        subtitle: "Get a Discount for Every Course Order only Valid for Today!.",
      ),
      HomeSection.categories(categories: categories, selectedIndex: 1),
      HomeSection.popularCourses(courses: courses, selectedFilter: 1),
      HomeSection.topMentors(mentors: mentors),
    ];
  }
}
