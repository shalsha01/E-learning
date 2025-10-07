import 'package:flutter/material.dart';
import 'package:e_learning_app/core/theme/spacing.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String subtitle;
  const HeaderWidget({
    super.key,
    required this.name,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    

    return Padding(
      padding: const EdgeInsets.only(top: Spacing.small),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, $name', style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                )),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: colorScheme.onPrimary,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withAlpha(40),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Icon(Icons.notifications_none, color: colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
