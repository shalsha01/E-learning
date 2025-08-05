import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/features/router/app_router.dart';

Future<void> showPasswordResetSuccessDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const PasswordResetSuccessDialog(),
  );
}

class PasswordResetSuccessDialog extends HookWidget {
  const PasswordResetSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

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
            Navigator.of(context).pop(); // Close dialog
            context.router.replace(const LoginRoute());
          }
        });
      }
      return () => timerRef.value?.cancel();
    }, []);

    return Dialog(
      elevation: 0,
      backgroundColor: colorScheme.surface, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.xxxLarge,
          horizontal: Spacing.large,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
        
            SvgPicture.asset(
              'assets/images/process.svg',
              height: 120,
            ),
            const SizedBox(height: Spacing.xLarge),

        
            Text(
              l10n.congratulations, 
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface, 
              ),
            ),
            const SizedBox(height: Spacing.medium),

         
            Text(
              l10n.account_ready_redirecting, 
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),

            const SizedBox(height: Spacing.xLarge),

            SizedBox(
              height:Spacing.large,
              width: Spacing.large,
              child: CircularProgressIndicator(
                strokeWidth: 2.4,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
