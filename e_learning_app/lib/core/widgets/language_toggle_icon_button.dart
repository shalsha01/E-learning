import 'package:e_learning_app/core/providers/app_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/language_provider.dart';

class LanguageToggleIconButton extends ConsumerWidget {
  const LanguageToggleIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final languageNotifier = ref.watch(languageNotifierProvider);
    // final currentLocale = languageNotifier.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;

    final provider = appSettingsProvider;
    final state = ref.watch(provider);
    final notifire = ref.read(appSettingsProvider.notifier);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        icon: const Icon(Icons.language),
        tooltip: state.locale == 'en' ? 'Change Language' : 'تغيير اللغة',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (_) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('English'),
                    onTap: () async {
                      // ref.read(languageNotifierProvider).setLanguage(const Locale('en'));

                      await notifire.updateLocale("en");
                      if (!context.mounted) return;
                      Navigator.of(context).pop();
                    },
                    trailing: state.locale == 'en'
                        ? Icon(Icons.check, color: colorScheme.primary)
                        : null,
                  ),
                  ListTile(
                    title: const Text('العربية'),
                    onTap: () async {
                      await notifire.updateLocale("ar");
                      if (!context.mounted) return;
                      Navigator.of(context).pop();
                    },
                    trailing: state.locale == 'ar'
                        ? Icon(Icons.check, color: colorScheme.primary)
                        : null,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
