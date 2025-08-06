import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/features/auth/data/models/user_model.dart';
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
import 'package:e_learning_app/features/auth/providers/authentication_provider.dart';
import 'package:e_learning_app/features/auth/data/models/login_request.dart';



@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final rememberMe = useState(false);
    final isPasswordVisible = useState(false);

    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    
    
    final provider = ref.read(authenticationProvider.notifier);
    final mutation = useMutation<UserModel>();

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
                children: [
                  const SizedBox(height: Spacing.huge),
                  SvgPicture.asset('assets/images/telead.svg', height: 80),
                  const SizedBox(height: Spacing.xxxLarge),

                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      l10n.sign_in,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: Spacing.small),

                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      l10n.login_subtitle,
                      style: textTheme.bodyMedium,
                    ),
                  ),

                  const SizedBox(height: Spacing.xxLarge),

                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: l10n.email,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value == null || value.isEmpty ? l10n.email_required : null,
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
                        onPressed: () => isPasswordVisible.value =
                            !isPasswordVisible.value,
                      ),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? l10n.password_required : null,
                  ),

                  const SizedBox(height: Spacing.small),

                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe.value,
                        onChanged: (v) => rememberMe.value = v ?? false,
                        activeColor: colorScheme.primary,
                        checkColor: colorScheme.onPrimary,
                        side: BorderSide(color: colorScheme.primary, width: 2.0),
                      ),
                      Text(
                        l10n.remember_me,
                        style: textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          context.router.push(const ForgotPasswordMethodRoute());
                        },
                        child: Text(
                          l10n.forgot_password,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: Spacing.medium),

                  if (mutation.isLoading)
                    const CircularProgressIndicator()
                  else
                    PrimaryButton(
                      text: l10n.sign_in,
                      onPressed: () {
                        if (!formKey.currentState!.validate()) return;
                        final request = LoginRequest(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );

                        mutation.mutate(
                          () => provider.login(request),
                          context: context,
                          data: (user) {
                            context.router.replace(const FillProfileRoute());
                          },
                          error: (error, stackTrace) {
                            print('Login error: $error');
                          },
                        );
                      },
                    ),

                  const SizedBox(height: Spacing.xxxLarge),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${l10n.dont_have_acount} ",
                        style: textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () => context.router.push(const RegisterRoute()),
                        child: Text(
                          l10n.sign_up,
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