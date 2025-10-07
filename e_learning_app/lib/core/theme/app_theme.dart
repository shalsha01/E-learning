import 'package:flutter/material.dart';
import 'colors/app_colors_light.dart';
import 'colors/app_colors_dark.dart';
import 'typography/typography.dart';

class AppThemes {
  static ThemeData lightTheme = _buildTheme(AppColorsLight.colors);
  static ThemeData darkTheme = _buildTheme(AppColorsDark.colors);

  static ThemeData _buildTheme(colors) {
    return ThemeData(
      useMaterial3: true,
      brightness: colors.background == Colors.white ? Brightness.light : Brightness.dark,
      colorScheme: ColorScheme(
        brightness: colors.background == Colors.white ? Brightness.light : Brightness.dark,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        background: colors.background,
        onBackground: colors.onBackground,
        surface: colors.surface,
        onSurface: colors.onSurface,
        error: colors.error,
        onError: colors.onPrimary,
      ),
      scaffoldBackgroundColor: colors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: colors.onSurface,
      ),
      textTheme: AppTypography.textTheme(colors),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        hintStyle: TextStyle(color: colors.onSurfaceVariant),
        prefixIconColor: colors.primary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.fabBackground,
        foregroundColor: colors.fabForeground,
      ),
    );
  }
}
