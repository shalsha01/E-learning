import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/features/home/widgets/home_banner_carousel.dart';
import 'package:e_learning_app/features/home/widgets/popular_courses_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/theme/spacing.dart';
import 'package:e_learning_app/features/home/models/home_section.dart';
import 'package:e_learning_app/features/home/providers/home_provider.dart';
import 'package:e_learning_app/features/home/widgets/header_widget.dart';
import 'package:e_learning_app/features/home/widgets/search_bar_widget.dart';
import 'package:e_learning_app/features/home/widgets/section_header_widget.dart';
import 'package:e_learning_app/features/home/widgets/categories/categories_widget.dart';
import 'package:e_learning_app/features/home/widgets/popular_courses_widget.dart';
import 'package:e_learning_app/features/home/widgets/top_mentors_widget.dart';
import 'package:e_learning_app/features/home/widgets/shimmer/shimmer_blocks.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final homeState = ref.watch(homeProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(homeProvider.future),
          child: homeState.when(
            data: (homeSections) => ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.large,
                vertical: Spacing.large,
              ),
              itemBuilder: (_, index) => HomeSectionBuilder(
                section: homeSections[index],
                localizations: localizations,
              ),
              separatorBuilder: (_, __) =>
                  const SizedBox(height: Spacing.large),
              itemCount: homeSections.length,
            ),
            loading: () => const HomeShimmerList(),
            error: (error, stackTrace) => ListView(
              padding: const EdgeInsets.all(Spacing.large),
              children: [
                const SizedBox(height: Spacing.huge),
                Icon(Icons.error_outline, color: colorScheme.error, size: 48),
                const SizedBox(height: Spacing.medium),
                Text(
                  localizations.somethingWentWrong,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spacing.medium),
                FilledButton(
                  onPressed: () => ref.refresh(homeProvider.future),
                  child: Text(localizations.retry),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeSectionBuilder extends ConsumerWidget {
  final HomeSection section;
  final AppLocalizations localizations;

  const HomeSectionBuilder({
    super.key,
    required this.section,
    required this.localizations,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return section.when(
      header: (name, subtitle) => HeaderWidget(
        name: name,
        subtitle: subtitle,
      ),
      searchBar: () => const SearchBarWidget(),
      banner: (banners) => HomeBannerCarousel(banners: banners),
      categories: (categories, selectedIndex) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeaderWidget(
            title: localizations.categories,
            onSeeAll: null,
          ),
         
          const SizedBox(height: Spacing.small),
         
          CategoriesWidget(
            categories: categories,
            selectedIndex: selectedIndex,
            onCategorySelected: (int value) {

            ref.read(homeProvider.notifier).selectCategory(value);
            },
          ),
     
        ],
      ),
      popularCourses: (courses, selectedFilter,categories) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              SectionHeaderWidget(
            title: localizations.home_popularCourses,
            onSeeAll: () {},
          ),
          const SizedBox(height: Spacing.medium),
            PopularCoursesCategories(
            categories:categories,
            selectedIndex: selectedFilter,
            onCategorySelected: (int value) {
              ref.read(homeProvider.notifier).selectPopularCoursesCategory(value);
            },
          ),
      
          const SizedBox(height: Spacing.small),
          PopularCoursesWidget(courses: courses),
        ],
      ),
      topMentors: (mentors) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeaderWidget(
            title: localizations.topMentor,
            onSeeAll: () {},
          ),
          const SizedBox(height: Spacing.small),
          TopMentorsWidget(mentors: mentors),
        ],
      ),
    );
  }
}
