import 'package:flutter/material.dart';
import 'package:e_learning_app/core/theme/spacing.dart';
import 'package:e_learning_app/features/home/models/course_model.dart';
import 'asset_image_widget.dart';

class PopularCoursesWidget extends StatelessWidget {
  final List<Course> courses;
  const PopularCoursesWidget({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: courses.map(_CourseCard.new).toList(),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard(this.course);
  final Course course;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      width: 220,
      margin: const EdgeInsets.all( Spacing.small),
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.12),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: AssetImageWidget(
              path: course.imageUrl,
              height: 120,
              width: 220,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Spacing.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.category,
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: 6),
                Text(
                  course.title,
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
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(course.price,
                              style: textTheme.titleSmall?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w800)),
                          const SizedBox(width: 10),
                          Icon(Icons.star, size: 16, color: Colors.amber[600]),
                          const SizedBox(width: 4),
                          Text('${course.rating}',
                              style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant)),
                          const SizedBox(width: 10),
                          Container(
                            width: 1.2,
                            height: 12,
                            color: colorScheme.onSurfaceVariant.withAlpha(60),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text('${course.studentsCount} Std',
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant)),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.bookmark_border,
                          color: colorScheme.secondary),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
