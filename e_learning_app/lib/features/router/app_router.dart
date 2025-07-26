import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/core/constants/prefs_keys.dart';
import 'package:e_learning_app/features/auth/providers/shared_preferences_provider.dart';
import 'package:e_learning_app/features/auth/screens/fill_profile_screen.dart';
import 'package:e_learning_app/features/auth/screens/login_screen.dart';
import 'package:e_learning_app/features/auth/screens/register_screen.dart';
import 'package:e_learning_app/features/onboarding/smooth_page_indicator.dart';
import 'package:e_learning_app/features/auth/screens/forgot_password/forgot_password_method_page.dart'; 
import 'package:e_learning_app/features/auth/screens/forgot_password/otp_verification_page.dart';
import 'package:e_learning_app/features/auth/screens/forgot_password/create_new_password_page.dart';
import 'package:e_learning_app/features/auth/screens/forgot_password/password_reset_success_page.dart';
import 'package:e_learning_app/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';




part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  late final Ref ref;
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: IntroductionRoute.page,
          initial: true,
          guards: [IsNotSeenOnboardingGuard(ref)],
        ),
        AutoRoute(
          page: LoginRoute.page,
          guards: [IsSeeOnboardingGuard(ref)],
        ),
        AutoRoute(
          page: RegisterRoute.page,
        ),
        AutoRoute(
          page: FillProfileRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),     
        AutoRoute(
          page:ForgotPasswordMethodRoute.page
          ),
        AutoRoute(
          page:OTPVerificationRoute.page
        ),
        AutoRoute(
          page: CreateNewPasswordRoute.page
          ),
        AutoRoute(
          page: PasswordResetSuccessRoute.page
          ),
  ];
}


class IsSeeOnboardingGuard implements AutoRouteGuard {
  const IsSeeOnboardingGuard(this.ref);
  final Ref ref;

  
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final isSeenOnboarding = prefs.getBool(PrefsKeys.isSeenOnboarding) ?? false;

    if (isSeenOnboarding) {
      resolver.next(true);
    } else {
      resolver.next(false);
      router.replace(const IntroductionRoute());
    }
  }
}

class IsNotSeenOnboardingGuard implements AutoRouteGuard {
  const IsNotSeenOnboardingGuard(this.ref);
  final Ref ref;
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final isSeenOnboarding = prefs.getBool(PrefsKeys.isSeenOnboarding) ?? false;

    if (!isSeenOnboarding) {
      resolver.next(true);
    } else {
      router.replace(const HomeRoute());
    }
  }
}


        

    