import 'package:flutter/material.dart';

class SemanticColors {
  // Primary roles
  final Color primary;
  final Color onPrimary;

  // Secondary roles
  final Color secondary;
  final Color onSecondary;

  // Surface & Background
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color onSurfaceVariant;

  // State colors
  final Color error;
  final Color warning;
  final Color success;

  // FAB
  final Color fabBackground;
  final Color fabForeground;

  const SemanticColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.error,
    required this.warning,
    required this.success,
    required this.fabBackground,
    required this.fabForeground,
  });
}
