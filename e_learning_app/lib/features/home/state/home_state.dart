import 'package:e_learning_app/features/home/models/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_learning_app/features/home/models/category_model.dart';
import 'package:e_learning_app/features/home/models/course_model.dart';
import 'package:e_learning_app/features/home/models/mentor_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(SectionState.loading()) SectionState<List<CategoryModel>> categories,
    @Default(SectionState.loading()) SectionState<List<CourseModel>> popularCourses,
    @Default(SectionState.loading()) SectionState<List<MentorModel>> topMentors,
  }) = _HomeState;

  get categories => null;

  HomeState copyWith({required SectionState<List<MentorModel>> topMentors, required SectionState popularCourses, required SectionState<List<CategoryModel>> categories}) {}
}

@freezed
class SectionState<T> with _$SectionState<T> {
  const factory SectionState.loading() = _Loading<T>;
  const factory SectionState.data(T data) = _Data<T>;
  const factory SectionState.error(String message) = _Error<T>;
}
