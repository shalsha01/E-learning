import 'package:e_learning_app/core/theme/spacing.dart';
import 'package:e_learning_app/features/onboarding/model/intro_item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class OnboardingPage extends StatelessWidget {
  final IntroItemData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              data.imagePath,
              height: screenHeight * 0.28,
              fit: BoxFit.contain,
              placeholderBuilder: (context) =>
                  const CircularProgressIndicator(),
            ),
            const SizedBox(height: Spacing.xxLarge),
            Text(
              data.title,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Spacing.small),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.medium),
              child: Text(
                data.description,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
