import 'package:flutter/material.dart';
import 'font_sizes.dart';
import '../colors/semantic_colors.dart';


final class AppTextStyles {
  
  static TextStyle title(SemanticColors colors) => TextStyle(
        fontSize: AppFontSizes.xl,
        fontWeight: FontWeight.bold,
        color: colors.onSurface,
      );

  
  static TextStyle subtitle(SemanticColors colors) => TextStyle(
        fontSize: AppFontSizes.md,
        color: colors.onSurfaceVariant,
      );

  
  static TextStyle button(SemanticColors colors) => TextStyle(
        fontSize: AppFontSizes.base,
        fontWeight: FontWeight.w600,
        color: colors.onPrimary,
      );


  static TextStyle body(SemanticColors colors) => TextStyle(
        fontSize: AppFontSizes.base,
        color: colors.onSurface,
      );
}
