import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/features/home/models/home_section.dart';
import 'package:e_learning_app/features/home/repository/home_repository.dart';

final homeNotifierProvider =
    AsyncNotifierProvider<HomeNotifier, List<HomeSection>>(() => HomeNotifier());

class HomeNotifier extends AsyncNotifier<List<HomeSection>> {
  final _repository = HomeRepository();

  @override
  Future<List<HomeSection>> build() async {
    return _repository.fetchHomeSections();
  }
}
