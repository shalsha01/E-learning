import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifiers/language_notifier.dart';

class LanguageToggleIconButton extends ConsumerWidget {
  const LanguageToggleIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(languageNotifierProvider);
    final langCode = currentLocale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      icon: const Icon(Icons.language),
      tooltip: langCode == 'en' ? 'Change Language' : 'تغيير اللغة',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  ref.read(languageNotifierProvider.notifier).setLanguage(const Locale('en'));
                  Navigator.of(context).pop();
                },
                trailing: langCode == 'en'
                    ? Icon(Icons.check, color: colorScheme.primary)
                    : null,
              ),
              ListTile(
                title: const Text('العربية'),
                onTap: () {
                  ref.read(languageNotifierProvider.notifier).setLanguage(const Locale('ar'));
                  Navigator.of(context).pop();
                },
                trailing: langCode == 'ar'
                    ? Icon(Icons.check, color: colorScheme.primary)
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
