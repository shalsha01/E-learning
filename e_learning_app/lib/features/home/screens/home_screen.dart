import 'package:e_learning_app/features/home/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/home_state.dart';
import 'package:e_learning_app/features/home/widgets/category_list.dart';
import 'package:e_learning_app/features/home/widgets/course_list.dart';
import 'package:e_learning_app/features/home/widgets/mentor_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildSpecialOffer(),
            const SizedBox(height: 16),
            SectionBuilder(
              title: "Categories",
              onSeeAll: () {},
              state: homeState.categories,
              builder: (data) => CategoryList(categories: data),
            ),
            const SizedBox(height: 16),
            SectionBuilder(
              title: "Popular Courses",
              onSeeAll: () {},
              state: homeState.popularCourses,
              builder: (data) => CourseList(courses: data),
            ),
            const SizedBox(height: 16),
            SectionBuilder(
              title: "Top Mentors",
              onSeeAll: () {},
              state: homeState.topMentors,
              builder: (data) => MentorList(mentors: data),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Hi, Ronald A. Martin", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("What Would you like to learn Today?\nSearch Below.", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search for..",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.filter_list),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildSpecialOffer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        "25% OFF*\nToday's Special\nGet a Discount for Every Course Order only Valid for Today!",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class CategoryList {
}

class SectionBuilder<T> extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;
  final SectionState<List<T>> state;
  final Widget Function(List<T>) builder;

  const SectionBuilder({
    super.key,
    required this.title,
    required this.onSeeAll,
    required this.state,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            TextButton(onPressed: onSeeAll, child: const Text("See All")),
          ],
        ),
        state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          data: builder,
          error: (message) => Text("Error: $message"),
        ),
      ],
    );
  }
}
