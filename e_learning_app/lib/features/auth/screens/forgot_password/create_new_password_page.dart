import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/app_text_styles.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/features/router/app_router.dart';

@RoutePage()
class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

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
          key: _formKey,
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
                controller: _newPassword,
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
                controller: _confirmPassword,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: l10n.password,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.password_required;
                  }
                  if (value != _newPassword.text) {
                    return l10n.passwords_do_not_match;
                  }
                  return null;
                },
              ),
              const Spacer(),
              PrimaryButton(
                text: l10n.continueLabel,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
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
