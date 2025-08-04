import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/features/router/app_router.dart';

@RoutePage()
class OTPVerificationPage extends HookWidget {
  final String method;

  const OTPVerificationPage({super.key, required this.method});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final pinController = useTextEditingController();
    final secondsRemaining = useState(59);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (secondsRemaining.value == 0) {
          t.cancel();
        } else {
          secondsRemaining.value--;
        }
      });
      return timer.cancel;
    }, []);

    void verifyCode() {
      if (pinController.text.length == 4) {
        context.router.push(const CreateNewPasswordRoute());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.enter_code_message)),
        );
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
              "${l10n.code_sent_to} $method",
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
                      color: colorScheme.shadow.withOpacity(0.2),
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
              secondsRemaining.value > 0
                  ? l10n.resend_code_in('${secondsRemaining.value}')
                  : l10n.resend_code_in('0'),
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: Spacing.xxLarge),

            PrimaryButton(
              text: l10n.verify,
              onPressed: verifyCode,
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