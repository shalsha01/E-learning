import 'package:flutter/material.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/features/home/models/mentor_model.dart';
import 'asset_image_widget.dart';

class TopMentorsWidget extends StatelessWidget {
  final List<Mentor> mentors;
  const TopMentorsWidget({super.key, required this.mentors});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: mentors.length,
        separatorBuilder: (_, __) => const SizedBox(width: Spacing.medium),
        itemBuilder: (_, i) {
          final m = mentors[i];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withAlpha(28),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: AssetImageWidget(
                  path: m.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 72,
                child: Text(
                  m.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style:textTheme.labelMedium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
