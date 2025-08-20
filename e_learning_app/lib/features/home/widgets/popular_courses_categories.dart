import 'package:e_learning_app/features/home/models/pupular_courses_category.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/core/constants/spacing.dart';

class PopularCoursesCategories extends StatelessWidget {
  final List<PupularCoursesCategory> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  const PopularCoursesCategories({
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


    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: Spacing.small),
      child: Row(
        children: categories.asMap().entries.map((entry) {
          final index = entry.key;
          final category = entry.value;
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onCategorySelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.medium,
                vertical: 8,
              ),
              margin: const EdgeInsets.only(right: Spacing.small),
              decoration: BoxDecoration(
                color: isSelected ? colorScheme.secondary : colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Text(
                category.title,
                style: textTheme.labelLarge?.copyWith(
                  color: isSelected
                      ? colorScheme.onSecondary
                      : colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );

  }
}
