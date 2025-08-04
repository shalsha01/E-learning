import 'package:flutter/material.dart';
import 'package:e_learning_app/core/constants/spacing.dart';

class ContactOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const ContactOption({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(Spacing.large),
        decoration: BoxDecoration(
          color: colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(Spacing.medium),
          border: Border.all(
            color: isSelected ? colorScheme.secondary : colorScheme.outline.withOpacity(0.2),
            width: isSelected ? 2 : 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(Spacing.small),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.secondary.withOpacity(0.1),
                border: Border.all(color: colorScheme.secondary),
              ),
              child: Icon(icon, size: Spacing.large, color: colorScheme.secondary),
            ),
            const SizedBox(width: Spacing.large),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: Spacing.tiny),
                  Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
