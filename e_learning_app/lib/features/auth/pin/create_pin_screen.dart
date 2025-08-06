import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:e_learning_app/features/auth/pin/pin_provider.dart';
import 'package:e_learning_app/features/auth/pin/pin_success_dialog.dart';

@RoutePage()
class CreatePinScreen extends HookConsumerWidget {
  const CreatePinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinController = useTextEditingController();
    final pinState = ref.watch(pinControllerProvider);
    final pinNotifier = ref.read(pinControllerProvider.notifier);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text("Create New PIN", style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.large),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add a PIN to keep your account more secure.",
                style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Spacing.xxLarge),
              Pinput(
                controller: pinController,
                length: 4,
                obscureText: true,
                keyboardType: TextInputType.number,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                defaultPinTheme: PinTheme(
                  width: Spacing.xxxxLarge,
                  height: Spacing.xxxxLarge,
                  textStyle: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    color: colorScheme.onPrimary,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withAlpha(80),
                        blurRadius: Spacing.medium,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(Spacing.medium),
                  ),
                ),
              ),
              const SizedBox(height: Spacing.xxLarge),
              pinState.isLoading
                  ? const CircularProgressIndicator()
                  : PrimaryButton(
                      text: "Continue",
                      onPressed: () async {
                        final success = await pinNotifier.submitPin(pinController.text);
                        if (success) {
                          await showPinSuccessDialog(context);
                        } else if (pinState.hasError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(pinState.error ?? "Something went wrong")),
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
