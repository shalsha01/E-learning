import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:e_learning_app/core/constants/app_text_styles.dart';
import 'package:e_learning_app/core/constants/spacing.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';
import 'package:e_learning_app/features/router/app_router.dart';


@RoutePage()
class OTPVerificationPage extends StatefulWidget {
  final String method;

  const OTPVerificationPage({super.key, required this.method});

  @override 
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  late Timer _timer;
  int _secondsRemaining = 59;
  final _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pinController.dispose();
    super.dispose();
  }

  void _verifyCode() {
    if (_pinController.text.length == 4) {
      context.router.push(const CreateNewPasswordRoute());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter the 4-digit code")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tr = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(tr.forgot_password_title, style: AppTextStyles.title),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.large),
        child: Column(
          children: [
            const SizedBox(height: Spacing.xxLarge),
            Text("${tr.code_sent_to} ${widget.method}", style: AppTextStyles.body),
            const SizedBox(height: Spacing.xLarge),

            Pinput(
              controller: _pinController,
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
              _secondsRemaining > 0
                  ? tr.resend_code_in('${_secondsRemaining}')
                  : tr.resend_code_in('0s'),
              style: AppTextStyles.body,
            ),

            const SizedBox(height: Spacing.xxLarge),

            PrimaryButton(
              text: tr.verify,
              onPressed: _verifyCode,
            ),
          ],
        ),
      ),
    );
  }
}
