import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../router/app_router.dart';

@RoutePage()
class ForgotPasswordMethodPage extends StatefulWidget {
  const ForgotPasswordMethodPage({super.key});

  @override
  State<ForgotPasswordMethodPage> createState() =>
      _ForgotPasswordMethodPageState();
}

class _ForgotPasswordMethodPageState extends State<ForgotPasswordMethodPage> {
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tr = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        title: Text(tr.forgot_password_title, style: AppTextStyles.title),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.large),
            Text(
              tr.reset_password_instruction,
              style: AppTextStyles.body
                  .copyWith(color: colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: Spacing.xLarge),
            _ContactOption(
              icon: Icons.email_outlined,
              title: tr.via_email,
              subtitle: 'priscilla.frank26@gmail.com',
              isSelected: selectedMethod == 'email',
              onTap: () => setState(() => selectedMethod = 'email'),
            ),
            const SizedBox(height: Spacing.medium),
            _ContactOption(
              icon: Icons.sms_outlined,
              title: tr.via_sms,
              subtitle: '(+1) 480-894-5529',
              isSelected: selectedMethod == 'sms',
              onTap: () => setState(() => selectedMethod = 'sms'),
            ),
            const Spacer(),
            PrimaryButton(
              text: tr.continueLabel,
              onPressed: () {
                if (selectedMethod != null) {
                  context.router
                      .push(OTPVerificationRoute(method: selectedMethod!));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _ContactOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Spacing.medium),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Spacing.small),
          color: isSelected
              ? colorScheme.primary.withOpacity(0.1)
              : colorScheme.surfaceVariant.withOpacity(0.1),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28, color: colorScheme.primary),
            const SizedBox(width: Spacing.medium),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.body),
                Text(subtitle,
                    style: AppTextStyles.body
                        .copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
