import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/core/constants/prefs_keys.dart';
import 'package:e_learning_app/core/notifiers/shared_preferences_provider.dart';
import 'package:e_learning_app/features/auth/screens/fill_profile_screen.dart';
import 'package:e_learning_app/features/auth/screens/login_screen.dart';
import 'package:e_learning_app/features/auth/screens/register_screen.dart';
import 'package:e_learning_app/features/onboarding/smooth_page_indicator.dart';
import 'package:e_learning_app/home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_router.gr.dart';

final routerProvider = Provider((ref) {
  return AppRouter(ref);
});

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this.ref);

  final Ref ref;

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
