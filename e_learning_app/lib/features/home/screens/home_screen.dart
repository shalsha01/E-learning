import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/features/home/models/home_section.dart';
import 'package:e_learning_app/features/home/providers/home_provider.dart';
import 'package:e_learning_app/features/home/widgets/banner_widget.dart';
import 'package:e_learning_app/features/home/widgets/categories_widget.dart';
import 'package:e_learning_app/features/home/widgets/popular_courses_widget.dart';
import 'package:e_learning_app/features/home/widgets/top_mentors_widget.dart';
import 'package:e_learning_app/features/home/widgets/shimmer_loading.dart';
import 'package:auto_route/auto_route.dart';


@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  Widget _buildSection(HomeSection section) {
    return section.when(
      banner: (imageUrl, title, subtitle) =>
          BannerWidget(imageUrl: imageUrl, title: title, subtitle: subtitle),
      categories: (categories, selectedIndex) =>
          CategoriesWidget(categories: categories, selectedIndex: selectedIndex),
      popularCourses: (courses) =>
          PopularCoursesWidget(courses: courses),
      topMentors: (mentors) =>
          TopMentorsWidget(mentors: mentors),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    return Scaffold(
      body: homeState.when(
        data: (sections) => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: sections.length,
          itemBuilder: (context, index) => _buildSection(sections[index]),
        ),
        loading: () => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: 4,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, __) => const ShimmerLoading(width: double.infinity, height: 180),
        ),
        error: (error, _) => Center(child: Text('Something went wrong: $error')),
      ),
    );
  }
}
