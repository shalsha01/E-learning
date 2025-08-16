import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/features/auth/forgot_password/widget/password_reset_success_dialog.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';

@RoutePage()
class CreateNewPasswordPage extends HookWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          l10n.create_new_password_title,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(Spacing.large),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        const SizedBox(height: Spacing.large),
                        Text(
                          l10n.create_new_password_title,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
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
                          validator: (value) => value == null || value.isEmpty
                              ? l10n.password_required
                              : null,
                        ),
                        const SizedBox(height: Spacing.medium),
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline),
                            hintText: l10n.confirm_password,
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
                        const SizedBox(height: Spacing.xxxLarge),
                        PrimaryButton(
                          text: l10n.continueLabel,
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) =>
                                    const PasswordResetSuccessDialog(),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(l10n.fix_errors_first),
                                ),
                              );
                            }
                          },
                        ),
                        const Spacer(),
                        const SizedBox(height: Spacing.huge),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
