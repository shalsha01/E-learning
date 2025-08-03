import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/app_text_styles.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/features/router/app_router.dart';

@RoutePage()
class CreateNewPasswordPage extends HookWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.create_new_password_title),
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),
      backgroundColor: colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(Spacing.large),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: Spacing.xLarge),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.create_new_password_title,
                  style: AppTextStyles.title.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: Spacing.large),
              TextFormField(
                controller: newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: l10n.password,
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? l10n.password_required : null,
              ),
              const SizedBox(height: Spacing.medium),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: l10n.password,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.password_required;
                  }
                  if (value != newPasswordController.text) {
                    return l10n.passwords_do_not_match;
                  }
                  return null;
                },
              ),
              const Spacer(),
              PrimaryButton(
                text: l10n.continueLabel,
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    context.router.push(const PasswordResetSuccessRoute());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.fix_errors_first),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
