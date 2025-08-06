import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/features/auth/pin/pin_state.dart';
import 'package:e_learning_app/features/auth/pin/pin_repository.mock.dart';

final pinControllerProvider =
    StateNotifierProvider<PinController, PinState>((ref) {
  final repository = ref.watch(pinRepositoryProvider);
  return PinController(repository);
});

class PinController extends StateNotifier<PinState> {
  final PinRepository _repository;

  PinController(this._repository) : super(PinState.initial());

  Future<bool> submitPin(String pin) async {
    state = state.copyWith(isLoading: true, hasError: false, error: null);
    try {
      final success = await _repository.setPin(pin);
      state = state.copyWith(isLoading: false);
      return success;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        error: e.toString(),
      );
      return false;
    }
  }
}
