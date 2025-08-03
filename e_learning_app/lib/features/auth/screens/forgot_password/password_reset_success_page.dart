import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/app_text_styles.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/features/router/app_router.dart';

@RoutePage()
class PasswordResetSuccessPage extends StatelessWidget {
  const PasswordResetSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tr = AppLocalizations.of(context)!;

    // Redirect to Login screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      context.router.replace(const LoginRoute());
    });

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer.withOpacity(0.95),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.large),
          child: Container(
            padding: const EdgeInsets.all(Spacing.large),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(Spacing.large),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.verified_user_rounded, size: 80, color: Colors.green),
                const SizedBox(height: Spacing.medium),
                Text(
                  tr.password_reset_success_title, 
                  style: AppTextStyles.title,
                ),
                const SizedBox(height: Spacing.small),
                Text(
                  tr.password_reset_success_message, 
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: Spacing.large),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
