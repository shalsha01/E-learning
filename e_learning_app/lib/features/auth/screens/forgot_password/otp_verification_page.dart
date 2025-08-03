import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/app_text_styles.dart';
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

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(l10n.forgot_password_title, style: AppTextStyles.title),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.large),
        child: Column(
          children: [
            const SizedBox(height: Spacing.xxLarge),
            Text("${l10n.code_sent_to} $method", style: AppTextStyles.body),
            const SizedBox(height: Spacing.xLarge),

            Pinput(
              controller: pinController,
              length: 4,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              defaultPinTheme: PinTheme(
                width: 56,
                height: 64,
                textStyle: AppTextStyles.title,
                decoration: BoxDecoration(
                  border: Border.all(color: colorScheme.primary),
                  borderRadius: BorderRadius.circular(Spacing.small),
                ),
              ),
            ),

            const SizedBox(height: Spacing.large),

            Text(
              secondsRemaining.value > 0
                  ? l10n.resend_code_in('${secondsRemaining.value}s')
                  : l10n.resend_code_in('0s'),
              style: AppTextStyles.body,
            ),

            const SizedBox(height: Spacing.xxLarge),

            PrimaryButton(
              text: l10n.verify,
              onPressed: verifyCode,
            ),
          ],
        ),
      ),
    );
  }
}
