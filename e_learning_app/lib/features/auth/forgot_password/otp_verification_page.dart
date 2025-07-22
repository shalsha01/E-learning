import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/spacing.dart';
import '../../../core/widgets/primary_button.dart';
import '../../router/app_router.dart';

@RoutePage()
class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({super.key});

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
            Text("${tr.code_sent_to} (+1) *** *** 5529", style: AppTextStyles.body),
            const SizedBox(height: Spacing.xLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) => _otpBox(context, tr.otp_example[index * 2])),
            ),
            const SizedBox(height: Spacing.large),
            Text(tr.resend_code_in('59'), style: AppTextStyles.body),
            
            const SizedBox(height: Spacing.xxLarge),
            PrimaryButton(
              text: tr.verify,
              onPressed: () => context.router.push(const CreateNewPasswordRoute()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpBox(BuildContext context, String value) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 48,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.primary),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(value, style: AppTextStyles.title),
    );
  }
}
