import 'package:e_learning_app/features/home/models/category_model.dart';
import 'package:e_learning_app/features/home/models/course_model.dart';
import 'package:e_learning_app/features/home/models/mentor_model.dart';

class HomeRepository {
  Future<List<CategoryModel>> fetchCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      CategoryModel(id: 1, name: "3D Design", iconUrl: ''),
      CategoryModel(id: 2, name: "Arts & Humanities", iconUrl: ''),
      CategoryModel(id: 3, name: "Graphic Design", iconUrl: ''),
    ];
  }

  Future<List<CourseModel>> fetchPopularCourses() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      CourseModel(
        id: 1 ,
        title: "Graphic Design Advanced",
        price: 28,
        rating: 4.2,
        students: 7830,
        category: "Graphic Design",
      ),
    ];
  }

  Future<List<MentorModel>> fetchTopMentors() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      MentorModel(id: 1, name: "Sonja", imageUrl: ''),
      MentorModel(id: 2, name: "Jensen", imageUrl: ''),
      MentorModel(id: 3, name: "Victoria", imageUrl: ''),
      MentorModel(id: 4, name: "Casaldo", imageUrl: ''),
    ];
  }
}
