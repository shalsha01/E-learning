import 'package:flutter/material.dart';
import 'package:e_learning_app/core/constants/spacing.dart';

class CategoriesWidget extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  const CategoriesWidget({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: Spacing.small),
        itemBuilder: (context, i) {
          final selected = i == selectedIndex;
          return GestureDetector(
            onTap: () => onCategorySelected(i),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.medium,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: selected ? colorScheme.secondary : colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Text(
                categories[i],
                style: textTheme.labelLarge?.copyWith(
                  color: selected
                      ? colorScheme.onSecondary
                      : colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
