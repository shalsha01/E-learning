import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'otp_repository.dart';
import 'otp_state.dart';
import 'otp_repository.mock.dart';


final otpRepositoryProvider = Provider<OTPRepository>((ref) {
  return MockOtpRepository(); 
});


final otpProvider =
    StateNotifierProvider<OTPController, OTPState>((ref) {
  final repository = ref.watch(otpRepositoryProvider);
  return OTPController(repository);
});

class OTPController extends StateNotifier<OTPState> {
  final OTPRepository repository;

  OTPController(this.repository) : super(OTPState.initial());

  Future<bool> sendOtp(String method, String destination) async {
    state = state.copyWith(isLoading: true);
    try {
      final success = await repository.sendOtp(method, destination);
      state = state.copyWith(isLoading: false, errorMessage: null);
      return success;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  Future<bool> verifyOtp(String method, String destination, String code) async {
    state = state.copyWith(isLoading: true);
    try {
      final success = await repository.verifyOtp(method, destination, code);
      state = state.copyWith(isLoading: false, errorMessage: null);
      return success;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }
}
