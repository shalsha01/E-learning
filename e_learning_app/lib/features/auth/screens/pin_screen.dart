import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../router/app_router.dart';
import '../providers/pin_controller.dart';


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
        title: const Icon(Icons.check_circle, color: Colors.green, size:Spacing.xxxLarge),
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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Create New Pin")),
      backgroundColor: colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(Spacing.large),
        child: Align(
           alignment: Alignment.topCenter,
           widthFactor: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          
            
            children: [
              const SizedBox(height: Spacing.large),
              Text(
                "Add a Pin Number to Make Your Account more Secure",
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Spacing.xxLarge),
              Pinput(
                controller: pinController,
                length: 4,
                obscureText: true,
                defaultPinTheme: PinTheme(
                  width:Spacing.xxxxLarge,
                  height: Spacing.xxxxLarge,
                  textStyle: AppTextStyles.title,
                  decoration: BoxDecoration(
                    border: Border.all(color: colorScheme.primary),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
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
