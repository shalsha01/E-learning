import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:e_learning_app/features/auth/screens/forgot_password/widget/contact_option.dart';

enum ForgotMethod { email, sms }

@RoutePage()
class ForgotPasswordMethodPage extends HookWidget {
  const ForgotPasswordMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedMethod = useState<ForgotMethod?>(null);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: const BackButton(),
        title: Text(
          l10n.forgot_password_title,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),

                      Text(
                        l10n.reset_password_instruction,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: Spacing.xxLarge),

                      ContactOption(
                        icon: Icons.mail_outline,
                        title: l10n.via_email,
                        subtitle: 'priscilla.frank26@gmail.com',
                        isSelected: selectedMethod.value == ForgotMethod.email,
                        onTap: () => selectedMethod.value = ForgotMethod.email,
                      ),

                      const SizedBox(height: Spacing.medium),

                      ContactOption(
                        icon: Icons.sms_outlined,
                        title: l10n.via_sms,
                        subtitle: '( +1 ) 480-894-5529',
                        isSelected: selectedMethod.value == ForgotMethod.sms,
                        onTap: () => selectedMethod.value = ForgotMethod.sms,
                      ),

                      const SizedBox(height: Spacing.xxLarge),

                      if (selectedMethod.value != null) ...[
                        PrimaryButton(
                          text: l10n.continueLabel,
                          onPressed: () {
                            final methodStr = selectedMethod.value == ForgotMethod.email
                                ? 'email'
                                : 'sms';

                            context.router.push(
                              OTPVerificationRoute(method: methodStr),
                            );
                          },
                        ),
                        const SizedBox(height: Spacing.xxLarge),
                      ] else
                        const SizedBox(height: Spacing.xxLarge * 2),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
