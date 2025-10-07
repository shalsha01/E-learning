import 'package:e_learning_app/core/theme/colors/semantic_colors.dart';
import 'package:flutter/material.dart';
import 'font_sizes.dart';


class AppTypography {
  static TextTheme textTheme(SemanticColors colors) => TextTheme(

    
        displayLarge: TextStyle(
          fontSize: AppFontSizes.xxl,
          fontWeight: FontWeight.bold,
          color: colors.onSurface,
        ),

        titleLarge: TextStyle(
          fontSize: AppFontSizes.xl,
          fontWeight: FontWeight.bold,
          color: colors.onSurface,
        ),

        bodyLarge: TextStyle(
          fontSize: AppFontSizes.md,
          color: colors.onSurface,
        ),

        bodyMedium: TextStyle(
          fontSize: AppFontSizes.base,
          color: colors.onSurfaceVariant,
        ),

        labelLarge: TextStyle(
          fontSize: AppFontSizes.base,
          color: colors.primary,
        ),
      );
}
