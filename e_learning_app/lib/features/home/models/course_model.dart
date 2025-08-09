class CourseModel {
  final String title;
  final String category;
  final double price;
  final double rating;
  final int studentsCount;
  final String imageUrl;

  CourseModel({
    required this.title,
    required this.category,
    required this.price,
    required this.rating,
    required this.studentsCount,
    required this.imageUrl,
  });
}
