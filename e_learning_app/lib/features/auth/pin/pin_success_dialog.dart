import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:flutter_svg/svg.dart';

Future<void> showPinSuccessDialog(BuildContext context) async {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;
  final textTheme = theme.textTheme;
  final l10n = AppLocalizations.of(context)!;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.medium)),
      backgroundColor: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(Spacing.large),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
         
            SvgPicture.asset(
              'assets/images/process.svg', 
              width: 120,
              height: 120,
            ),

            const SizedBox(height: Spacing.large),

            Text(
              l10n.pin_created_successfully,
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: Spacing.small),

            Text(
              l10n.redirecting_to_home,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: Spacing.large),

            const CircularProgressIndicator(),
          ],
        ),
      ),
    ),
  );

  await Future.delayed(const Duration(seconds: 3));
  context.router.replace(const HomeRoute());
}