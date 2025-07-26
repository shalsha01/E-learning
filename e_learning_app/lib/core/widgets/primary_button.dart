import 'package:flutter/material.dart';
import '../constants/spacing.dart';
import '../constants/padding.dart';
import '../constants/font_sizes.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed, 
    bool? isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final theme =Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;


    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: Spacing.xxxxLarge,
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(1, 2),
              blurRadius: 8,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: PaddingSizes.xxSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                style:textTheme.titleMedium!.copyWith(
                  color: colorScheme.onPrimary,
                  fontSize: AppFontSizes.md,
               
                ),
            
              ),
            ),
            const SizedBox(width: Spacing.medium),
            Container(
              height: Spacing.xxLarge,
              width: Spacing.xxLarge,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colorScheme.onPrimary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward,
                color: colorScheme.primary,
                size: AppFontSizes.xl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
