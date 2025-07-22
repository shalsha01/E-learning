import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class ProfileState {
  final bool isLoading;
  final bool isSuccess;
  final String? error;
  ProfileState({this.isLoading = false, this.isSuccess = false, this.error});

  ProfileState copyWith({bool? isLoading, bool? isSuccess, String? error}) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier() : super(ProfileState());

  Future<void> saveProfile({
    required String fullName,
    required String nickName,
    required String dob,
    required String email,
    required String phone,
    required String? gender,
    File? image,
  }) async {
    state = state.copyWith(isLoading: true, isSuccess: false, error: null);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_fullName', fullName);
      await prefs.setString('profile_nickName', nickName);
      await prefs.setString('profile_dob', dob);
      await prefs.setString('profile_email', email);
      await prefs.setString('profile_phone', phone);
      await prefs.setString('profile_gender', gender ?? '');
      if (image != null) {
        await prefs.setString('profile_image', image.path);
      }
      state = state.copyWith(isLoading: false, isSuccess: true, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, isSuccess: false, error: e.toString());
    }
  }

  Future<Map<String, dynamic>> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'fullName': prefs.getString('profile_fullName') ?? '',
      'nickName': prefs.getString('profile_nickName') ?? '',
      'dob': prefs.getString('profile_dob') ?? '',
      'email': prefs.getString('profile_email') ?? '',
      'phone': prefs.getString('profile_phone') ?? '',
      'gender': prefs.getString('profile_gender') ?? '',
      'imagePath': prefs.getString('profile_image'),
    };
  }
}

final profileNotifierProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) => ProfileNotifier()); 