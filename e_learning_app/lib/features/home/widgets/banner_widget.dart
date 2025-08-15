import 'package:flutter/material.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/features/home/widgets/asset_image_widget.dart';

class BannerWidget extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;

  const BannerWidget({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
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
      ),
      child: Stack(
        children: [
          Positioned.fill(
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
                        Text('25% OFF*', 
                          style:textTheme.labelLarge?.copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(title,
                          style:textTheme.titleLarge?.copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(subtitle,
                          style:textTheme.bodySmall?.copyWith(
                            color: colorScheme.onPrimary.withAlpha(220),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: List.generate(3, (i) {
                            final active = i == 1;
                            return Container(
                              margin: const EdgeInsets.only(right: 6),
                              width: active ? 16 : 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: active ? colorScheme.onPrimary : colorScheme.onPrimary.withAlpha(120),
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
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(Spacing.large),
              child: AssetImageWidget(
                path: imageAsset,
                width: 160,
                height: 160,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
