import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/language_provider.dart';

class LanguageToggleIconButton extends ConsumerWidget {
  const LanguageToggleIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageNotifier = ref.watch(languageNotifierProvider);
    final currentLocale = languageNotifier.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        icon: const Icon(Icons.language),
        tooltip: currentLocale == 'en' ? 'Change Language' : 'تغيير اللغة',
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
                    onTap: () {
                      ref.read(languageNotifierProvider).setLanguage(const Locale('en'));
                      Navigator.of(context).pop();
                    },
                    trailing: currentLocale == 'en'
                        ? Icon(Icons.check, color: colorScheme.primary)
                        : null,
                  ),
                  ListTile(
                    title: const Text('العربية'),
                    onTap: () {
                      ref.read(languageNotifierProvider).setLanguage(const Locale('ar'));
                      Navigator.of(context).pop();
                    },
                    trailing: currentLocale == 'ar'
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
