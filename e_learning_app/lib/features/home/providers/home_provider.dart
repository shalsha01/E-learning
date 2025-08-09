import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/features/home/repository/home_repository.dart';
import 'package:e_learning_app/features/home/state/home_state.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController(HomeRepository());
});

class HomeController extends StateNotifier<HomeState> {
  final HomeRepository repository;
  HomeController(this.repository) : super(const HomeState()) {
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    await loadCategories();
    await loadPopularCourses();
    await loadTopMentors();
  }

  Future<void> loadCategories() async {
    try {
      final categories = await repository.fetchCategories();
      state = state.copyWith(categories: SectionState.data(categories), topMentors: null, popularCourses: null);
    } catch (e) {
      state = state.copyWith(categories: SectionState.error(e.toString()), topMentors: null, popularCourses: null);
    }
  }

  Future<void> loadPopularCourses() async {
    try {
      final courses = await repository.fetchPopularCourses();
      state = state.copyWith(popularCourses: SectionState.data(courses), topMentors: null, categories: null);
    } catch (e) {
      state = state.copyWith(popularCourses: SectionState.error(e.toString()));
    }
  }

  Future<void> loadTopMentors() async {
    try {
      final mentors = await repository.fetchTopMentors();
      state = state.copyWith(topMentors: SectionState.data(mentors), popularCourses: null, categories: null);
    } catch (e) {
      state = state.copyWith(topMentors: SectionState.error(e.toString()), popularCourses: null, categories: null);
    }
  }
}
