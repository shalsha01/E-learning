import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning_app/features/home/models/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/features/home/widgets/asset_image_widget.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class HomeBannerCarousel extends HookWidget {
  final List<HomeBanner> banners;

  const HomeBannerCarousel({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    return CarouselSlider(
      options: CarouselOptions(
        height: 168,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        padEnds: false,
        onPageChanged: (index, reason) {
          currentIndex.value = index;
        },
      ),
      items: banners.asMap().entries.map((entry) {
        final banner = entry.value;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _BannerWidget(
            banner: banner,
            currentIndex: currentIndex.value,
            totalBanners: banners.length,
          ),
        );
      }).toList(),
    );
  }
}

class _BannerWidget extends StatelessWidget {
  final HomeBanner banner;
  final int currentIndex;
  final int totalBanners;

  const _BannerWidget({
    required this.banner,
    required this.currentIndex,
    required this.totalBanners,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      height: 168,
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withAlpha(36),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
        image: banner.image == null
            ? null
            : DecorationImage(
                image: AssetImage(banner.image!),
                fit: BoxFit.cover,
              ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: Spacing.large),
        child: Row(
          children: [
            const SizedBox(width: Spacing.large),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(banner.title,
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.w800,
                      )),
                  const SizedBox(height: 8),
                  Text(banner.subtitle,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onPrimary.withAlpha(220),
                      )),
                  const SizedBox(height: 12),
                  Row(
                    children: List.generate(totalBanners, (i) {
                      final isActive = i == currentIndex;
                      return Container(
                        margin: const EdgeInsets.only(right: 6),
                        width: isActive ? 16 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: isActive
                              ? colorScheme.onPrimary
                              : colorScheme.onPrimary.withAlpha(120),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
