import 'dart:async';
import 'package:e_learning_app/features/home/models/home_banner.dart';
import 'package:e_learning_app/features/home/models/home_section.dart';
import 'package:e_learning_app/features/home/models/course_model.dart';
import 'package:e_learning_app/features/home/models/mentor_model.dart';
import 'package:e_learning_app/features/home/models/pupular_courses_category.dart';

class HomeRepository {
  Future<List<HomeSection>> fetchHomeByCategory(int index) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final selectedCategory = categories[index];

    final filtered = selectedCategory == 'All'
        ? courses
        : courses.where((c) => c.category == selectedCategory).toList();

    return [
      HomeSection.popularCourses(
        courses: filtered,
        pupularCoursesCategoreies: pupularCoursesCategories,
        selectedFilter: index,
      ),
    ];
  }

  Future<List<HomeSection>> fetchHomeSections() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return homeResponse;
  }
}

final banners = [
  HomeBanner(
    image: 'assets/images/slid/slid1.webp',
    title: "",
    subtitle: "",
  ),
  HomeBanner(
    image: 'assets/images/slid/slid2.webp',
    title: "",
    subtitle: "",
  ),
  HomeBanner(
    image: 'assets/images/slid/slid3.webp',
    title: "",
    subtitle: "",
  ),
];

final categories = [
      'Graphic Design',
      'Web Development',
      'SEO & Marketing',
      'Finance & Accounting',
      'Personal Development',
      'Office Productivity',
      'HR Management',
    ];

final courses = <Course>[

  Course(
    title: 'Graphic Design Advanced',
    category: 'Graphic Design',
    price: '\$28',
    rating: 4.2,
    studentsCount: 7830,
    imageUrl: 'assets/images/Graphic_Design.png',
  ),
  Course(
    title: 'Advertisment Design',
    category: 'Graphic Design',
    price: '\$42',
    rating: 4.5,
    studentsCount: 6520,
    imageUrl: 'assets/images/Graphic_Design.png',
  ),
  Course(
    title: '3D Design Basics',
    category: '3D Design',
    price: '\$35',
    rating: 4.0,
    studentsCount: 4500,
    imageUrl: 'assets/images/Graphic_Design.png',
  ),
  Course(
    title: '3D Design',
    category: '3D Design',
    price: '\$60',
    rating: 4.7,
    studentsCount: 3200,
    imageUrl: 'assets/images/Graphic_Design.png',
  ),
  Course(
    title: 'Arts & Humanities Overview',
    category: 'Arts & Humanities',
    price: '\$50',
    rating: 4.8,
    studentsCount: 1200,
    imageUrl: 'assets/images/Graphic_Design.png',
  ),
];

final mentors = <Mentor>[
  Mentor(name: 'Sonja', imageUrl: 'assets/images/teachers/teacher1.webp'),
  Mentor(name: 'Jensen', imageUrl: 'assets/images/teachers/teacher2.webp'),
  Mentor(name: 'Victoria', imageUrl: 'assets/images/teachers/teacher3.webp'),
  Mentor(name: 'Castaldo', imageUrl: 'assets/images/teachers/teacher4.webp'),
];

final homeResponse = [
  HomeSection.header(
    greetingName: 'Ronald A. Martin',
    subtitle: 'What Would you like to learn Today?',
  ),
  const HomeSection.searchBar(),
  HomeSection.banner(
    banners: banners,
  ),
  HomeSection.categories(categories: categories, selectedIndex: 0),
  HomeSection.popularCourses(courses: courses, selectedFilter: 0,
    pupularCoursesCategoreies: pupularCoursesCategories,
  ),
  HomeSection.topMentors(mentors: mentors),
];

final pupularCoursesCategories = [
  PupularCoursesCategory(id: 1, title: 'All'),
  PupularCoursesCategory(id: 2, title: 'Graphic Design'),
  PupularCoursesCategory(id: 3, title: '3D Design'),
  PupularCoursesCategory(id: 4, title: 'Arts & Humanities'),
];