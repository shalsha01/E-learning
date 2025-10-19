import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/core/theme/spacing.dart';
import 'package:e_learning_app/features/home/models/mentor_model.dart';
import 'package:e_learning_app/features/home/widgets/asset_image_widget.dart';


@RoutePage()

class AllMentorsPage extends StatelessWidget {
  final List<Mentor> mentors;

  const AllMentorsPage({super.key, required this.mentors});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "All Mentors",
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.large,
          vertical: Spacing.medium,
        ),
        itemCount: mentors.length,
        separatorBuilder: (_, __) => const Divider(
          height: 30,
          thickness: 0.5,
        ),
        itemBuilder: (_, i) {
          final mentor = mentors[i];
          return Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: colorScheme.onPrimary,
                child: ClipOval(
                  child: AssetImageWidget(
                    path: mentor.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: Spacing.medium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mentor.name,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      mentor.category,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
