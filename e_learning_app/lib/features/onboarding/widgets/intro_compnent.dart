import 'package:flutter/material.dart';
import 'package:e_learning_app/features/onboarding/model/intro_item_data.dart';
import 'package:e_learning_app/core/theme/spacing.dart';
import 'package:e_learning_app/core/theme/typography/font_sizes.dart';
import 'package:e_learning_app/core/theme/typography/app_text_styles.dart';
import 'package:e_learning_app/core/theme/colors/semantic_colors.dart';
import 'package:e_learning_app/core/theme/colors/app_colors_light.dart';
import 'package:e_learning_app/core/theme/colors/app_colors_dark.dart';

class IntroItemWidget extends StatelessWidget {
  final IntroItemData data;

  const IntroItemWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final SemanticColors colors =
        theme.brightness == Brightness.light ? AppColorsLight.colors : AppColorsDark.colors;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          data.imagePath,
          height: 250,
        ),

        const SizedBox(height: Spacing.xLarge),

        Text(
          data.title,
          style: AppTextStyles.title(colors).copyWith(
            fontSize: AppFontSizes.xl,
          ),
        ),

        const SizedBox(height: Spacing.large),

        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
          child: Text(
            data.description,
            textAlign: TextAlign.center,
            style: AppTextStyles.body(colors).copyWith(
              fontSize: AppFontSizes.lg,
              color: colors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
