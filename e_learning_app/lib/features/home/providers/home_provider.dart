import 'package:e_learning_app/features/home/models/course_model.dart';
import 'package:e_learning_app/features/home/models/home_section.dart';
import 'package:e_learning_app/features/home/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

@riverpod
class Home extends _$Home {
  @override
  Future<List<HomeSection>> build() async {
    final repository = ref.read(homeRepositoryProvider);
    return repository.fetchHomeSections();

  }

  
  Future<void> selectCategory(int index) async {
    final repository = ref.read(homeRepositoryProvider);

    final current = state.valueOrNull;
    if (current == null) return;

    final updated = current.map((section) {
      return section.maybeWhen(
        categories: (categories, _) => HomeSection.categories(
          categories: categories,
          selectedIndex: index, 
        ),
        orElse: () => section,
      );
    }).toList();
    
    final filteredCourses = await repository.fetchHomeByCategory(index);
    final finalSections = updated.map((section) {
      return section.maybeWhen(
        popularCourses: (_, __) => HomeSection.popularCourses(
          courses: filteredCourses.whereType<Course>().toList(),
          selectedFilter: index,
        ),
        orElse: () => section,
      );
    }).toList();

    state = AsyncValue.data(finalSections);
  }
}
