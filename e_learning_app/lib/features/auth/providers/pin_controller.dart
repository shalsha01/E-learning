import 'package:flutter_riverpod/flutter_riverpod.dart';

final pinControllerProvider = StateNotifierProvider<PinController, AsyncValue<void>>(
  (ref) => PinController(),
);

class PinController extends StateNotifier<AsyncValue<void>> {
  PinController() : super(const AsyncData(null));

  Future<void> submitPin(String pin) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));

    if (pin == "1234") {
      state = const AsyncData(null);
    } else {
      state = AsyncError("Invalid PIN", StackTrace.current);
    }
  }
}
