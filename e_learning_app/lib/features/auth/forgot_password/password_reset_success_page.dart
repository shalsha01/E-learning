import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/spacing.dart';
import '../../router/app_router.dart';

@RoutePage()
class PasswordResetSuccessPage extends StatelessWidget {
  const PasswordResetSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tr = AppLocalizations.of(context)!;

    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      context.router.replace(const HomeRoute());
    });

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(Spacing.large),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(Spacing.large),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock_open_rounded, size: 80, color: Colors.green),
              const SizedBox(height: Spacing.medium),
              Text(tr.password_reset_success_title, style: AppTextStyles.title),
              const SizedBox(height: Spacing.small),
              Text(
                tr.password_reset_success_message,
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),
              const SizedBox(height: Spacing.medium),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
