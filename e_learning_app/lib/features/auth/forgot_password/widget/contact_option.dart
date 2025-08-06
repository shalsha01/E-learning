import 'package:flutter/material.dart';
import 'package:e_learning_app/core/constants/app_text_styles.dart';
import 'package:e_learning_app/core/constants/spacing.dart';

class ContactOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final TextEditingController? controller;
  final VoidCallback onTap;
  final TextInputType? inputType;

  const ContactOption({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    this.controller,
    this.inputType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(Spacing.large),
      margin: const EdgeInsets.symmetric(vertical: Spacing.small),
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(Spacing.medium),
        border: Border.all(
          color: isSelected ? colorScheme.secondary : colorScheme.onPrimary,
          width: isSelected ? 2 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                Text(title, style: AppTextStyles.body),
              ],
            ),
            if (isSelected) ...[
              const SizedBox(height: Spacing.medium),
              TextField(
                controller: controller,
                keyboardType: inputType,
                decoration: InputDecoration(
                  hintText: inputType == TextInputType.emailAddress
                      ? 'Enter your email'
                      : 'Enter your phone number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
