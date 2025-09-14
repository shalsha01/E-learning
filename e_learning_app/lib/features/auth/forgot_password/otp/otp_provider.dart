import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'otp_repository.dart';
import 'otp_repository.mock.dart';

part 'otp_provider.g.dart';

@riverpod
class Otp extends _$Otp {
  OTPRepository get _repository => ref.read(otpRepositoryProvider);

  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> sendOtp(String method, String destination,) async {
    final success = await _repository.sendOtp(method, destination);
    return success;
  }

  Future<bool> verifyOtp(String method, String destination, String code) async {
    final success = await _repository.verifyOtp(method, destination, code);
    return success;
  }
}

final otpRepositoryProvider = Provider<OTPRepository>((ref) {
  return MockOtpRepository();
});
