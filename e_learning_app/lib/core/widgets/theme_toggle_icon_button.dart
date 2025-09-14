import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/core/providers/app_settings_provider.dart';

class ThemeToggleIconButton extends ConsumerWidget {
  const ThemeToggleIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final notifier = ref.read(appSettingsProvider.notifier);
    final isDark = appSettings.theme == ThemeMode.dark;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Tooltip(
      message: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
      child: GestureDetector(
        onTap: () => notifier.toggleTheme(),
        child: Container(
          margin: const EdgeInsetsDirectional.only(start: 10.0),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.primary.withAlpha(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            isDark ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            size: 20,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
