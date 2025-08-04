import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/features/router/app_router.dart';

@RoutePage()
class PasswordResetSuccessPage extends HookWidget {
  const PasswordResetSuccessPage({super.key});

   @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    // Redirect to login after 3 seconds
    useEffect(() {
      final timer = Future.delayed(const Duration(seconds: 3), () {
        context.router.replace(const LoginRoute());
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: colorScheme.background,
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
                  l10n.password_reset_success_title,
                  style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: Spacing.small),
                Text(
                  l10n.password_reset_success_message,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: Spacing.large),
                Column(
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: Spacing.small),
                    Text(
                      l10n.redirecting_to_login,
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}