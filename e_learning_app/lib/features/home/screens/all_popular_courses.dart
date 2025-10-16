import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/features/home/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/features/home/repository/home_repository.dart';
import 'package:e_learning_app/features/home/widgets/popular_courses_categories.dart';
import 'package:e_learning_app/features/home/widgets/popular_courses_widget.dart';

@RoutePage()
class AllCoursesPage extends StatefulWidget {
  const AllCoursesPage({super.key});

  @override
  State<AllCoursesPage> createState() => _AllCoursesPageState();
}

class _AllCoursesPageState extends State<AllCoursesPage> {
  int selectedCategoryIndex = 0;
  late List<Course> displayedCourses;

  @override
  void initState() {
    super.initState();
    displayedCourses = courses; // default = all
  }

  void _onCategorySelected(int index) {
    setState(() {
      selectedCategoryIndex = index;
      final selectedCategory = pupularCoursesCategories[index].title;

      if (selectedCategory == 'All') {
        displayedCourses = courses;
      } else {
        displayedCourses = courses
            .where((c) => c.category == selectedCategory)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Popular Courses",
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        backgroundColor: colorScheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Categories chips
            SizedBox(
              height: 46,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: pupularCoursesCategories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = pupularCoursesCategories[index];
                  final isSelected = index == selectedCategoryIndex;
                  return GestureDetector(
                    onTap: () => _onCategorySelected(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        category.title,
                        style: textTheme.bodyMedium?.copyWith(
                          color: isSelected
                              ? Colors.white
                              : colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 Courses list
            Expanded(
              child: ListView.separated(
                itemCount: displayedCourses.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final course = displayedCourses[index];
                  return PopularCoursesWidget(courses: displayedCourses);

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
