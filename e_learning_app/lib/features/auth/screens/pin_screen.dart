import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:e_learning_app/features/auth/providers/pin_controller.dart';

@RoutePage()
class CreatePinScreen extends ConsumerStatefulWidget {
  const CreatePinScreen({super.key});

  @override
  ConsumerState<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends ConsumerState<CreatePinScreen> {
  final pinController = TextEditingController();

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Icon(Icons.check_circle, color: Colors.green, size: Spacing.xxxLarge),
        content: const Text("PIN created successfully!"),
        actions: [
          TextButton(
            onPressed: () => context.router.replace(const HomeRoute()),
            child: const Text("Go to Home page"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pinState = ref.watch(pinControllerProvider);
    final pinNotifier = ref.read(pinControllerProvider.notifier);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(title: Text("Create New Pin", style: textTheme.titleMedium)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.large),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add a Pin Number to Make Your Account more Secure",
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Spacing.xxLarge),
              Pinput(
                controller: pinController,
                length: 4,
                obscureText: true,
                keyboardType: TextInputType.number,
                defaultPinTheme: PinTheme(
                  width: Spacing.xxxxLarge,
                  height: Spacing.xxxxLarge,
                  textStyle: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: colorScheme.primary),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: Spacing.xxLarge),
              pinState.isLoading
                  ? const CircularProgressIndicator()
                  : PrimaryButton(
                      text: "Continue",
                      onPressed: () async {
                        await pinNotifier.submitPin(pinController.text);
                        if (ref.read(pinControllerProvider).hasValue) {
                          _showSuccessDialog();
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
