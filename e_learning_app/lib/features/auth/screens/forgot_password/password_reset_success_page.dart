import 'dart:async';
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

    final counter = useState(3);
    final timerRef = useRef<Timer?>(null);
    final isRedirected = useRef(false); 

    useEffect(() {
      if (!isRedirected.value) {
        isRedirected.value = true;
        timerRef.value = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (counter.value > 1) {
            counter.value--;
          } else {
            timer.cancel();
            context.router.replace(const LoginRoute());
          }
        });
      }

      return () => timerRef.value?.cancel();
    }, []);

    return Scaffold(
      backgroundColor: colorScheme.surface,
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
                  color: Colors.black.withAlpha(50),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified_user_rounded, size:Spacing.huge, color:colorScheme.secondary),
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
                      '${l10n.redirecting_to_login} (${counter.value})',
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
