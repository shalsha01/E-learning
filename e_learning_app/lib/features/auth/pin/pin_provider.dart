import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'pin_repository.mock.dart';


part 'pin_provider.g.dart';

@riverpod
class Pin extends _$Pin {
  PinRepository get _repository => ref.read(pinRepositoryProvider);
  
  FutureOr<void> build() async {

    return;
  }

  Future<bool> submitPin(String pin) async {
    final success = await _repository.setPin(pin);
    return success;
  }
}

final pinRepositoryProvider = Provider<PinRepository>((ref) {
  return MockPinRepository();
});
