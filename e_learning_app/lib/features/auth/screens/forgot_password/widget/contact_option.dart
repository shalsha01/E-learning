import 'package:e_learning_app/core/constants/app_text_styles.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:flutter/material.dart';


class ContactOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const ContactOption({super.key, 
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(Spacing.large),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(Spacing.medium),
          border: Border.all(
            color: isSelected
                ? colorScheme.secondary
                : colorScheme.outline.withOpacity(0.3),
            width: isSelected ? 2 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withOpacity(0.1),
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
                border: Border.all(
                  color: colorScheme.secondary,
                ),
              ),
              child: Icon(icon, size: 24, color: colorScheme.secondary),
            ),
            const SizedBox(width: Spacing.large),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.body),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
