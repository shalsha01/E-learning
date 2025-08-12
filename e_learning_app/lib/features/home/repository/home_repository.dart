import 'package:e_learning_app/features/home/models/home_section.dart';
import 'package:e_learning_app/features/home/models/course_model.dart';
import 'package:e_learning_app/features/home/models/mentor_model.dart';

class HomeRepository {
  Future<List<HomeSection>> fetchHomeSections() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      HomeSection.banner(
        imageUrl: 'assets/images/online.svg',
        title: "25% OFF* Today's Special",
        subtitle: "Get a Discount for Every Course Order only Valid for Today!",
      ),
      HomeSection.categories(
        categories: ['3D Design', 'Arts & Humanities', 'Graphic Design'],
        selectedIndex: 1,
      ),
      HomeSection.popularCourses(
        courses: [
          Course(
            title: 'Graphic Design Advanced',
            category: 'Graphic Design',
            price: '\$28',
            rating: 4.2,
            studentsCount: 7830,
            imageUrl: 'assets/images/online.svg',
          ),
        ],
      ),
      HomeSection.topMentors(
        mentors: [
          Mentor(name: 'Sonja', imageUrl: 'assets/images/online.svg'),
          Mentor(name: 'Jensen', imageUrl: 'assets/images/online.svg'),
        ],
      ),
    ];
  }
}
