import 'package:flutter/material.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/features/home/models/course_model.dart';
import 'asset_image_widget.dart';

class PopularCoursesWidget extends StatelessWidget {
  final List<Course> courses;
  const PopularCoursesWidget({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
      height: 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        separatorBuilder: (_, __) => const SizedBox(width: Spacing.medium),
        itemBuilder: (_, i) {
          final c = courses[i];
          return Container(
            width: 220,
            decoration: BoxDecoration(
              color: colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withAlpha(32),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(18)),
                  child: AssetImageWidget(
                    path: c.imageUrl,
                    height: 110,
                    width: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Spacing.medium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(c.category,
                          style: textTheme.labelMedium?.copyWith(
                            color: colorScheme.secondary,
                            fontWeight: FontWeight.w700,
                          )),
                      const SizedBox(height: 6),
                      Text(
                        c.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(c.price,
                              style: textTheme.titleSmall?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w800)),
                          const SizedBox(width: 10),
                          Icon(Icons.star, size: 16, color: Colors.amber[600]),
                          const SizedBox(width: 4),
                          Text('${c.rating}',
                              style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant)),
                          const SizedBox(width: 10),
                          Container(
                            width: 1.2,
                            height: 12,
                            color: colorScheme.onSurfaceVariant.withAlpha(60),
                          ),
                          const SizedBox(width: 10),
                          Text('${c.studentsCount} Std',
                              style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant)),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.bookmark_border,
                                color: colorScheme.secondary),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
