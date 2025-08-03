import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/core/providers/theme_provider.dart';

class ThemeToggleIconButton extends ConsumerWidget {
  const ThemeToggleIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider);
    final isDark = themeNotifier.isDark;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Tooltip(
      message: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
      child: GestureDetector(
        onTap: () => ref.read(themeNotifierProvider).toggleTheme(),
        child: Container(
          margin: const EdgeInsetsDirectional.only(start: 10.0),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // ignore: deprecated_member_use
            color: colorScheme.primary.withOpacity(0.1),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            isDark 
            ? Icons.wb_sunny_outlined 
            : Icons.nightlight_round,
            size: 20,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
