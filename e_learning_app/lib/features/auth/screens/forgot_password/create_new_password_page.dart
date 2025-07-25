import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../router/app_router.dart';

@RoutePage()
class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tr = AppLocalizations.of(context)!;

    final newPassword = TextEditingController();
    final confirmPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(tr.create_new_password_title)),
      backgroundColor: colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(Spacing.large),
        child: Column(
          children: [
            const SizedBox(height: Spacing.xLarge),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(tr.create_new_password_title, style: AppTextStyles.body),
            ),
            const SizedBox(height: Spacing.large),
            TextField(
              controller: newPassword,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: tr.password,
              ),
            ),
            const SizedBox(height: Spacing.medium),
            TextField(
              controller: confirmPassword,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: tr.password,
              ),
            ),
            const Spacer(),
            PrimaryButton(
              text: tr.continueLabel,
              onPressed: () {
                context.router.push(const PasswordResetSuccessRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
