import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/features/home/models/home_section.dart';
import 'package:e_learning_app/features/home/providers/home_provider.dart';
import 'package:e_learning_app/features/home/widgets/header_widget.dart';
import 'package:e_learning_app/features/home/widgets/search_bar_widget.dart';
import 'package:e_learning_app/features/home/widgets/banner_widget.dart';
import 'package:e_learning_app/features/home/widgets/section_header_widget.dart';
import 'package:e_learning_app/features/home/widgets/categories_widget.dart';
import 'package:e_learning_app/features/home/widgets/popular_courses_widget.dart';
import 'package:e_learning_app/features/home/widgets/top_mentors_widget.dart';
import 'package:e_learning_app/features/home/widgets/shimmer_blocks.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(homeProvider);

    Widget buildSection(HomeSection s) {
      return s.when(
        header: (name, subtitle) => HeaderWidget(
          name: name,
          subtitle: subtitle,
        ),
        searchBar: () => const SearchBarWidget(),
        banner: (image, title, subtitle) => BannerWidget(
          imageAsset: image,
          title: title,
          subtitle: subtitle,
        ),

        categories: (cats, selected) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeaderWidget(
              title: l10n.categories,
              onSeeAll: null,
            ),
            const SizedBox(height: Spacing.small),
            // هذا الويجت داخله ListView أفقي مُحدّد الارتفاع
            CategoriesWidget(categories: cats, selectedIndex: selected),
          ],
        ),

        popularCourses: (courses, selectedFilter) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeaderWidget(
              title: l10n.home_popularCourses,
              onSeeAll: () {},
            ),
            const SizedBox(height: Spacing.small),
            PopularCoursesWidget(courses: courses),
          ],
        ),

        topMentors: (mentors) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeaderWidget(
              title: l10n.topMentor,
              onSeeAll: () {},
            ),
            const SizedBox(height: Spacing.small),
            TopMentorsWidget(mentors: mentors),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(homeProvider.notifier).refresh(),
          child: state.when(
            data: (sections) => ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.large,
                vertical: Spacing.large,
              ),
              itemBuilder: (_, i) => buildSection(sections[i]),
              separatorBuilder: (_, __) => const SizedBox(height: Spacing.large),
              itemCount: sections.length,
            ),
            loading: () => const HomeShimmerList(),
            error: (e, st) => ListView(
              padding: const EdgeInsets.all(Spacing.large),
              children: [
                const SizedBox(height: Spacing.huge),
                Icon(Icons.error_outline, color: colorScheme.error, size: 48),
                const SizedBox(height: Spacing.medium),
                Text(
                  l10n.somethingWentWrong,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spacing.medium),
                FilledButton(
                  onPressed: () => ref.read(homeProvider.notifier).refresh(),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
