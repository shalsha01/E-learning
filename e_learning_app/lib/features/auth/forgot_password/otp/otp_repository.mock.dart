import 'dart:async';
import 'otp_repository.dart';

class MockOtpRepository implements OTPRepository {
  @override
  Future<bool> sendOtp(String method, String destination) async {
    await Future.delayed(const Duration(seconds: 1));
    print('OTP sent to $method: $destination');
    return true;
  }

  @override
  Future<bool> verifyOtp(String method, String destination, String code) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Verifying OTP: $code for $destination via $method');
    return code == '1234'; 
  }
}
