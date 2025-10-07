import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpod_hook_mutation/riverpod_hook_mutation.dart';

import 'package:e_learning_app/core/theme/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/features/auth/pin/pin_provider.dart';
import 'package:e_learning_app/features/auth/pin/pin_success_dialog.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';

@RoutePage()
class CreatePinScreen extends HookConsumerWidget {
  const CreatePinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinController = useTextEditingController();
    final l10n = AppLocalizations.of(context)!;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final submitPinMutation = useMutation<bool>();

    void onKeyboardTap(String value) {
      if (value == 'del') {
        if (pinController.text.isNotEmpty) {
          pinController.text =
              pinController.text.substring(0, pinController.text.length - 1);
        }
      } else {
        if (pinController.text.length < 4) {
          pinController.text += value;
        }
      }
    }

    Widget buildNumberButton(String number) {
      return GestureDetector(
        onTap: () => onKeyboardTap(number),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            number,
            style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          l10n.create_new_pin,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.large),
          child: Column(
            children: [
              const SizedBox(height: Spacing.xxLarge),

              Text(
                l10n.create_pin_description,
                style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: Spacing.xLarge),

              Pinput(
                controller: pinController,
                length: 4,
                obscureText: true,
                keyboardType: TextInputType.none,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                defaultPinTheme: PinTheme(
                  width: Spacing.xxxxLarge,
                  height: Spacing.xxxxLarge,
                  textStyle: textTheme.headlineLarge,
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

              PrimaryButton(
                text: l10n.continueLabel,
                isLoading: submitPinMutation.isLoading,
                onPressed: () {
                  if (pinController.text.length == 4) {
                    submitPinMutation.mutate(
                      () => ref.read(pinProvider.notifier).submitPin(pinController.text),
                      context: context,
                      data: (success) async {
                        if (success) {
                          await showPinSuccessDialog(context);
                          context.router.pop(); 
                        }
                      },
                      error: (error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              error.toString().isNotEmpty
                                  ? error.toString()
                                  : l10n.something_went_wrong,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),

              const SizedBox(height: Spacing.xxLarge),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: Spacing.small,
                  crossAxisSpacing: Spacing.small,
                  childAspectRatio: 1.6,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ...List.generate(9, (index) => buildNumberButton('${index + 1}')),
                    const SizedBox(),
                    buildNumberButton('0'),
                    GestureDetector(
                      onTap: () => onKeyboardTap('del'),
                      child: const Icon(Icons.backspace_outlined, size: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}   
