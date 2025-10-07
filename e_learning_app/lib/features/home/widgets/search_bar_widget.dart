import 'package:flutter/material.dart';
import 'package:e_learning_app/core/theme/spacing.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;


    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withAlpha(38),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: Spacing.medium),
      child: Row(
        children: [
          Icon(Icons.search, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: Spacing.small),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: l10n.searchHint, 
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: colorScheme.primary.withAlpha(24),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.tune, color: colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
