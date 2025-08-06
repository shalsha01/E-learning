import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PinRepository {
  Future<bool> setPin(String pin);
}

class MockPinRepository implements PinRepository {
  @override
  Future<bool> setPin(String pin) async {
    await Future.delayed(const Duration(seconds: 1));
    if (pin.length == 4) {
      return true;
    } else {
      throw Exception("Invalid PIN length");
    }
  }
}

final pinRepositoryProvider = Provider<PinRepository>((ref) {
  return MockPinRepository();
});
