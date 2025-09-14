import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/features/auth/pin/create_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_learning_app/core/constants/prefs_keys.dart';
import 'package:e_learning_app/features/auth/providers/shared_preferences_provider.dart';
import 'package:e_learning_app/features/auth/screens/fill_profile_screen.dart';
import 'package:e_learning_app/features/auth/screens/login_screen.dart';
import 'package:e_learning_app/features/auth/screens/register_screen.dart';
import 'package:e_learning_app/features/onboarding/introduction_screen%20.dart';
import 'package:e_learning_app/features/auth/forgot_password/forgot_password_method_page.dart';
import 'package:e_learning_app/features/auth/forgot_password/otp/otp_verification_page.dart';
import 'package:e_learning_app/features/auth/forgot_password/create_new_password_page.dart';
import 'package:e_learning_app/features/home/screens/home_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.gr.dart';
part 'app_router.g.dart';

@riverpod
Raw<AppRouter> appRouter(Ref ref) {
  return AppRouter(ref: ref);
}

final routerProvider = Provider((ref) {
  return AppRouter(ref);
});

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter({required this.ref});

  final Ref ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: IntroductionRoute.page,
          initial: true,
          guards: [OnboardingCompletedGuard(ref)],
        ),
        AutoRoute(page: LoginRoute.page,
          guards: [OnboardingNotCompletedGuard(ref), NoAuthGuard(ref)],
        ),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ForgotPasswordMethodRoute.page),
        AutoRoute(page: OTPVerificationRoute.page),
        AutoRoute(page: CreateNewPasswordRoute.page),

        AutoRoute(
          page: FillProfileRoute.page,
          guards: [OnboardingNotCompletedGuard(ref), AuthGuard(ref)],
        ),
        AutoRoute(
          page: HomeRoute.page,
          guards: [OnboardingNotCompletedGuard(ref), AuthGuard(ref)],
        ),
        AutoRoute(
          page: CreatePinRoute.page,
          guards: [OnboardingNotCompletedGuard(ref), AuthGuard(ref)],
        ),
      ];
}



class AuthGuard implements AutoRouteGuard {
  const AuthGuard(this.ref);
  final Ref ref;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final token = prefs.getString(PrefsKeys.authToken);

    if (token == null || token.isEmpty) {
      router.replace(const LoginRoute());
      return;
    }

    resolver.next(true);
  }
}


class NoAuthGuard implements AutoRouteGuard {
  const NoAuthGuard(this.ref);
  final Ref ref;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final token = prefs.getString(PrefsKeys.authToken);

    if (token != null && token.isNotEmpty) {
      router.replace(const HomeRoute());
      return;
    }

    resolver.next(true);
  }
}


class OnboardingNotCompletedGuard
 implements AutoRouteGuard {
  const OnboardingNotCompletedGuard(this.ref);
  final Ref ref;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final isSeenOnboarding = prefs.getBool(PrefsKeys.isSeenOnboarding) ?? false;

    if (!isSeenOnboarding) {
      router.replace(const IntroductionRoute());
      return;
    }

    resolver.next(true);
  }
}


class OnboardingCompletedGuard implements AutoRouteGuard {
  const OnboardingCompletedGuard(this.ref);
  final Ref ref;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final isSeenOnboarding = prefs.getBool(PrefsKeys.isSeenOnboarding) ?? false;

    if (isSeenOnboarding) {
      final token = prefs.getString(PrefsKeys.authToken);
      if (token == null || token.isEmpty) {
        router.replace(const LoginRoute());
      } else {
        router.replace(const HomeRoute());
      }
    } else {
      resolver.next(true);
    }
  }
}
