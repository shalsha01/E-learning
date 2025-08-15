import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:e_learning_app/core/constants/font_sizes.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      background: AppColors.white,
      onBackground: AppColors.onSurface,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      error: AppColors.error,
      onError: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      foregroundColor: AppColors.onSurface,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      hintStyle: const TextStyle(color: AppColors.onSurfaceVariant),
      prefixIconColor: AppColors.primary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: AppFontSizes.xxl,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
      ),
      titleLarge: TextStyle(
        fontSize: AppFontSizes.xl,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
      ),
      bodyLarge: TextStyle(
        fontSize: AppFontSizes.md,
        color: AppColors.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: AppFontSizes.base,
        color: AppColors.onSurfaceVariant,
      ),
      labelLarge: TextStyle(
        fontSize: AppFontSizes.base,
        color: AppColors.primary,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.yellow,
      onPrimary: AppColors.black,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      background: AppColors.black,
      onBackground: AppColors.white,
      surface: Color(0xFF1E1E2C),
      onSurface: AppColors.white,
      error: AppColors.error,
      onError: AppColors.black,
    ),
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2A2A40),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIconColor: AppColors.mustard,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: AppFontSizes.xxl,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: const TextStyle(
        fontSize: AppFontSizes.xl,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: const TextStyle(
        fontSize: AppFontSizes.md,
        color: Colors.white,
      ),
      bodyMedium: const TextStyle(
        fontSize: AppFontSizes.base,
        color: Colors.grey,
      ),
      labelLarge: TextStyle(
        fontSize: AppFontSizes.base,
        color: AppColors.mustard,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mustard,
      foregroundColor: AppColors.black,
    ),
  );
}
