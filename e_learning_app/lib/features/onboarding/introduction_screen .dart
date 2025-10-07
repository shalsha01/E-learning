import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/core/theme/spacing.dart';
import 'package:e_learning_app/features/onboarding/model/intro_item_data.dart';
import 'package:e_learning_app/features/onboarding/widgets/onboarding_widget.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/core/widgets/theme_toggle_icon_button.dart';
import 'package:e_learning_app/core/widgets/language_toggle_icon_button.dart';
import 'package:e_learning_app/features/auth/providers/shared_preferences_provider.dart';
import 'package:e_learning_app/core/constants/prefs_keys.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class IntroductionScreen extends HookConsumerWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final pageController = usePageController();
    final currentIndex = useState(0); 
    final l10n = AppLocalizations.of(context)!;

    final List<IntroItemData> pages = [
      IntroItemData(
        title: l10n.introTitle1,
        description: l10n.introDesc1,
        imagePath: "assets/images/online.svg",
      ),
      IntroItemData(
        title: l10n.introTitle2,
        description: l10n.introDesc2,
        imagePath: "assets/images/anytimlearn.svg",
      ),
      IntroItemData(
        title: l10n.introTitle3,
        description: l10n.introDesc3,
        imagePath: "assets/images/getcertificate.svg",
      ),
    ];

    Future<void> onFinish() async {
      final prefs = ref.read(sharedPreferencesProvider);
      await prefs.setBool(PrefsKeys.isSeenOnboarding, true);

      context.router.replace(const LoginRoute());
    }

    void onNext() {
      if (currentIndex.value < pages.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        onFinish();
      }
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        leading: const ThemeToggleIconButton(),
        actions: [
          const LanguageToggleIconButton(),
          if (currentIndex.value != pages.length - 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.small),
              child: TextButton(
                onPressed: onFinish,
                child: Text(
                  l10n.skip,
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pages.length,
              onPageChanged: (index) => currentIndex.value = index,
              itemBuilder: (context, index) => OnboardingPage(
                data: pages[index],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: Spacing.large,
          right: Spacing.large,
          top: Spacing.medium,
          bottom: Spacing.xxxxLarge,
        ),
        child: Row(
          children: [
            SmoothPageIndicator(
              controller: pageController,
              count: pages.length,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                type: WormType.thin,
                spacing: 8,
                dotColor: colorScheme.primary.withAlpha(50),
                activeDotColor: colorScheme.primary,
              ),
            ),
            const Spacer(),
            currentIndex.value == pages.length - 1
                ? Expanded(
                    child: PrimaryButton(
                      text: l10n.getStarted,
                      onPressed: onFinish,
                    ),
                  )
                : FloatingActionButton(
                    onPressed: onNext,
                    backgroundColor: colorScheme.primary,
                    elevation: 0,
                    child: Icon(Icons.arrow_forward, color: colorScheme.onPrimary),
                  ),
          ],
        ),
      ),
    );
  }
}
