import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/features/home/models/home_section.dart';
import 'package:e_learning_app/features/home/repository/home_repository.dart';

final homeProvider =
    AsyncNotifierProvider<HomeController, List<HomeSection>>(HomeController.new);

class HomeController extends AsyncNotifier<List<HomeSection>> {
  late final HomeRepository _repository;

  @override
  Future<List<HomeSection>> build() async {
    _repository = HomeRepository();
    return _repository.fetchHomeSections();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _repository.fetchHomeSections());
  }
}
