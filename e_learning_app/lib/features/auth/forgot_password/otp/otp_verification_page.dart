import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/features/auth/forgot_password/widget/password_reset_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'otp_provider.dart';

@RoutePage()
class OTPVerificationPage extends HookConsumerWidget {
  final String method;
  final String destination;

  const OTPVerificationPage({
    super.key,
    required this.method,
    required this.destination,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final otpController = ref.read(otpProvider.notifier);
    final pinController = useTextEditingController();

    final verifyCountdown = useState(59);
    final resendCooldown = useState(60);
    final verifyTimerRef = useRef<Timer?>(null);
    final resendTimerRef = useRef<Timer?>(null);

    useEffect(() {
      verifyTimerRef.value = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (verifyCountdown.value == 0) {
          timer.cancel();
        } else {
          verifyCountdown.value--;
        }
      });

      resendTimerRef.value = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (resendCooldown.value == 0) {
          timer.cancel();
        } else {
          resendCooldown.value--;
        }
      });

      return () {
        verifyTimerRef.value?.cancel();
        resendTimerRef.value?.cancel();
      };
    }, []);

    void verifyCode() async {
      if (pinController.text.length == 4) {
        final success = await otpController.verifyOtp(method, destination, pinController.text);
        if (success && context.mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const PasswordResetSuccessDialog(),
          );
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.enter_code_message)),
            );
          }
        }
      }
    }

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
        elevation: 0,
        leading: const BackButton(),
        backgroundColor: colorScheme.surface,
        title: Text(
          l10n.forgot_password_title,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.large),
        child: Column(
          children: [
            const SizedBox(height: Spacing.xxLarge),
            Text(
              "${l10n.code_sent_to} $destination",
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Spacing.xLarge),
            Pinput(
              controller: pinController,
              length: 4,
              keyboardType: TextInputType.none,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 200),
              obscuringCharacter: '*',
              obscureText: true,
              defaultPinTheme: PinTheme(
                width: Spacing.xxxxxLarge,
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
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: Spacing.xxLarge),
            Text(
              verifyCountdown.value > 0
                  ? l10n.resend_code_in('${verifyCountdown.value}')
                  : '',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: Spacing.large),
            PrimaryButton(
              text: l10n.verify,
              onPressed: () async {
              verifyCode();
              final isVerified = ref.read(otpProvider).isVerified;
              if (isVerified && context.mounted) {
                context.router.push(const CreateNewPasswordRoute());
              }
              },
              isLoading: ref.watch(otpProvider.select((state) => state.isLoading)),
            ),
            const SizedBox(height: Spacing.medium),
            resendCooldown.value > 0
                ? Text(
                    '${l10n.resend_code_in('')} ${resendCooldown.value}s',
                    style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                  )
                : TextButton(
                    onPressed: () async {
                      final success = await otpController.sendOtp(method, destination);
                      if (success) {
                        resendCooldown.value = 60;
                        resendTimerRef.value?.cancel();
                        resendTimerRef.value = Timer.periodic(const Duration(seconds: 1), (timer) {
                          if (resendCooldown.value > 0) {
                            resendCooldown.value--;
                          } else {
                            timer.cancel();
                          }
                        });

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(l10n.code_resent)),
                          );
                        }
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(l10n.failed_to_send_code)),
                          );
                        }
                      }
                    },
                    child: Text(
                      l10n.resend_code,
                      style: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
                    ),
                  ),
            const SizedBox(height: Spacing.large),
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
    );
  }
}
