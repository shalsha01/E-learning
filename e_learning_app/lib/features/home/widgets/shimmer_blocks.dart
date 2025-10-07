import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:e_learning_app/core/theme/spacing.dart';

class HomeShimmerList extends StatelessWidget {
  const HomeShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    final base = Colors.grey.shade300;
    final highlight = Colors.grey.shade100;

    Widget box({double h = 140, double w = double.infinity, double r = 16}) =>
        Shimmer.fromColors(
          baseColor: base,
          highlightColor: highlight,
          child: Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(r),
            ),
          ),
        );

    return ListView.separated(
      padding: const EdgeInsets.all(Spacing.large),
      itemBuilder: (_, i) {
        switch (i) {
          case 0:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                box(h: 24, r: 6),
                const SizedBox(height: Spacing.small),
                box(h: 16, r: 6),
              ],
            );
          case 1:
            return box(h: 54, r: 16);
          case 2:
            return box(h: 168, r: 20);
          case 3:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                box(h: 24, w: 120, r: 6),
                const SizedBox(height: Spacing.small),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, __) => box(h: 40, w: 90, r: 22),
                    separatorBuilder: (_, __) => const SizedBox(width: Spacing.small),
                    itemCount: 5,
                  ),
                ),
              ],
            );
          case 4:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                box(h: 24, w: 160, r: 6),
                const SizedBox(height: Spacing.small),
                SizedBox(
                  height: 260,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, __) => box(h: 240, w: 220, r: 18),
                    separatorBuilder: (_, __) => const SizedBox(width: Spacing.medium),
                    itemCount: 3,
                  ),
                ),
              ],
            );
          default:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                box(h: 24, w: 140, r: 6),
                const SizedBox(height: Spacing.small),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, __) => box(h: 100, w: 64, r: 16),
                    separatorBuilder: (_, __) => const SizedBox(width: Spacing.medium),
                    itemCount: 6,
                  ),
                ),
              ],
            );
        }
      },
      separatorBuilder: (_, __) => const SizedBox(height: Spacing.large),
      itemCount: 6,
    );
  }
}
