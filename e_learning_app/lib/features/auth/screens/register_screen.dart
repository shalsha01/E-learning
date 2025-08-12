import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:riverpod_hook_mutation/riverpod_hook_mutation.dart';

import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/core/widgets/theme_toggle_icon_button.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:e_learning_app/features/auth/data/models/login_request.dart';
import 'package:e_learning_app/features/auth/data/models/user_model.dart';
import 'package:e_learning_app/features/auth/providers/authentication_provider.dart';


import 'package:e_learning_app/core/constants/prefs_keys.dart';
import 'package:e_learning_app/features/auth/providers/shared_preferences_provider.dart';

@RoutePage()
class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isPasswordVisible = useState(false);
    final agreed = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final mutation = useMutation<UserModel>();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: Spacing.medium),
          child: ThemeToggleIconButton(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: Spacing.huge),
                  SvgPicture.asset('assets/images/telead.svg', height: 80),
                  const SizedBox(height: Spacing.xxxLarge),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      l10n.getting_started,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.small),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      l10n.register_subtitle,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: Spacing.xxLarge),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: l10n.email,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? l10n.email_required
                        : null,
                  ),
                  const SizedBox(height: Spacing.large),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: l10n.password,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: colorScheme.onSurface,
                        ),
                        onPressed: () {
                          isPasswordVisible.value = !isPasswordVisible.value;
                        },
                      ),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? l10n.password_required
                        : null,
                  ),
                  const SizedBox(height: Spacing.small),
                  Row(
                    children: [
                      Checkbox(
                        value: agreed.value,
                        onChanged: (v) => agreed.value = v ?? false,
                        activeColor: colorScheme.primary,
                        shape: const CircleBorder(),
                        checkColor: colorScheme.onPrimary,
                        side: BorderSide(color: colorScheme.primary, width: 2.0),
                      ),
                      Expanded(
                        child: Text(
                          l10n.agree_terms,
                          style: textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Spacing.medium),
                  if (mutation.isLoading)
                    const CircularProgressIndicator()
                  else
                    PrimaryButton(
                      text: l10n.sign_up,
                      onPressed: () {
                        if (!formKey.currentState!.validate()) return;
                        if (!agreed.value) return;

                        final request = LoginRequest(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );

                        mutation.mutate(
                          () => ref.read(authenticationProvider.notifier).register(request),
                          context: context,
                          data: (user) async {
                          
                            final prefs = ref.read(sharedPreferencesProvider);
                            await prefs.setBool(PrefsKeys.isSeenOnboarding, true);
                            await prefs.setString(PrefsKeys.authToken, user.token ?? "");

                            context.router.replace(const FillProfileRoute());
                          },
                          error: (error, stackTrace) {
                            print('Register error: $error');
                          },
                        );
                      },
                    ),
                  const SizedBox(height: Spacing.xxxLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${l10n.have_acount} ",
                        style: textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () => context.router.pop(),
                        child: Text(
                          l10n.sign_in,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Spacing.large),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
