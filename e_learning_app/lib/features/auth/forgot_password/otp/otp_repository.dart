abstract class OTPRepository {
  Future<bool> sendOtp(String method, String destination);
  Future<bool> verifyOtp(String method, String destination, String code);
}
