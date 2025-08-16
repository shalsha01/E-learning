import 'package:e_learning_app/features/home/models/home_section.dart';
import 'package:e_learning_app/features/home/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'home_provider.g.dart';

@riverpod
class Home extends _$Home {
  @override
  Future<List<HomeSection>> build() async {
    final repository = HomeRepository();
    return repository.fetchHomeSections(); 
  }

  Future<void> selectCategory(int index) async {
    final repository = HomeRepository();
    final sections = await repository.fetchHomeByCategory(index); 
    state = AsyncValue.data(sections);
  }
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repository = HomeRepository();
    final sections = await repository.fetchHomeSections();
    state = AsyncValue.data(sections);
  }
}
