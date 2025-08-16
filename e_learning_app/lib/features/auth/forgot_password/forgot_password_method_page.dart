import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:e_learning_app/features/auth/forgot_password/widget/contact_option.dart';

enum ForgotMethod { email, sms }
@RoutePage()
class ForgotPasswordMethodPage extends HookWidget {
  const ForgotPasswordMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedMethod = useState<ForgotMethod?>(null);
    final emailController = useTextEditingController();
    final smsController = useTextEditingController();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(),
        title: Text(
          l10n.forgot_password_title,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: Spacing.xxLarge),
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
              isSelected: selectedMethod.value == ForgotMethod.email,
              controller: emailController,
              inputType: TextInputType.emailAddress,
              onTap: () => selectedMethod.value = ForgotMethod.email,
            ),
            const SizedBox(height: Spacing.medium),
            ContactOption(
              icon: Icons.sms_outlined,
              title: l10n.via_sms,
              isSelected: selectedMethod.value == ForgotMethod.sms,
              controller: smsController,
              inputType: TextInputType.phone,
              onTap: () => selectedMethod.value = ForgotMethod.sms,
            ),
            const SizedBox(height: Spacing.xxLarge),
            if (selectedMethod.value != null)
              PrimaryButton(
                text: l10n.continueLabel,
                onPressed: () {
                  final methodString =
                      selectedMethod.value == ForgotMethod.email ? 'email' : 'sms';
                  final inputValue = selectedMethod.value == ForgotMethod.email
                      ? emailController.text
                      : smsController.text;

                  if (inputValue.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter your ${methodString == 'email' ? 'email' : 'phone number'}.")),
                    );
                    return;
                  }

                  context.router.push(
                    CreateNewPasswordRoute(),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
