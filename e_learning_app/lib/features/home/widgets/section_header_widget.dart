import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
   final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;


    return Row(
      children: [
        Expanded(
          child: Text(title,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              )),
        ),
        if (onSeeAll != null)
          TextButton.icon(
            onPressed: onSeeAll,
            icon: Icon(Icons.chevron_right, size: 18, color: colorScheme.primary),
            label: Text('SEE ALL', // TODO l10n
                style: textTheme.labelLarge?.copyWith(color: colorScheme.primary)),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
      ],
    );
  }
}
