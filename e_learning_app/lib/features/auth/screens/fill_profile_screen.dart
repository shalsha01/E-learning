import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/constants/spacing.dart';
import '../../../../features/router/app_router.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/profile_notifier.dart';

final fullNameProvider = StateProvider<String>((ref) => '');
final nickNameProvider = StateProvider<String>((ref) => '');
final dobProvider = StateProvider<String>((ref) => '');
final profileEmailProvider = StateProvider<String>((ref) => '');
final phoneProvider = StateProvider<String>((ref) => '');
final genderProvider = StateProvider<String?>((ref) => null);
final selectedImageProvider = StateProvider<File?>((ref) => null);

@RoutePage()
class FillProfilePage extends HookConsumerWidget {
  const FillProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final fullName = ref.watch(fullNameProvider);
    final nickName = ref.watch(nickNameProvider);
    final dob = ref.watch(dobProvider);
    final email = ref.watch(profileEmailProvider);
    final phone = ref.watch(phoneProvider);
    final gender = ref.watch(genderProvider);
    final selectedImage = ref.watch(selectedImageProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final profileState = ref.watch(profileNotifierProvider);
    final profileNotifier = ref.read(profileNotifierProvider.notifier);

    Future<void> pickImage() async {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) {
        ref.read(selectedImageProvider.notifier).state = File(picked.path);
      }
    }

    Future<void> pickDate() async {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(2000),
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
      );
      if (pickedDate != null) {
        ref.read(dobProvider.notifier).state = DateFormat('yyyy-MM-dd').format(pickedDate);
      }
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.fill_profile),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
          child: Column(
            children: [
              const SizedBox(height: Spacing.large),

              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: colorScheme.primary.withOpacity(0.1),
                    backgroundImage: selectedImage != null
                        ? FileImage(selectedImage)
                        : null,
                    child: selectedImage == null
                        ? Icon(Icons.person, size: 50, color:colorScheme.primary)
                        : null,
                  ),
                  InkWell(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: colorScheme.secondary,
                      child:Icon(Icons.edit, size:16,color:colorScheme.onPrimary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.large),

              TextFormField(
                initialValue: fullName,
                onChanged: (value) => ref.read(fullNameProvider.notifier).state = value,
                decoration: InputDecoration(
                  hintText: l10n.full_name,
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: Spacing.medium),

              TextFormField(
                initialValue: nickName,
                onChanged: (value) => ref.read(nickNameProvider.notifier).state = value,
                decoration: InputDecoration(
                  hintText: l10n.nick_name,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: Spacing.medium),

              GestureDetector(
                onTap: pickDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    initialValue: dob,
                    decoration: InputDecoration(
                      hintText: l10n.dob,
                      prefixIcon: const Icon(Icons.date_range),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Spacing.medium),

              TextFormField(
                initialValue: email,
                onChanged: (value) => ref.read(profileEmailProvider.notifier).state = value,
                decoration: InputDecoration(
                  hintText: l10n.email,
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              const SizedBox(height: Spacing.medium),

              TextFormField(
                initialValue: phone,
                onChanged: (value) => ref.read(phoneProvider.notifier).state = value,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '724-848-1225',
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(width: 10),
                      Icon(Icons.flag),
                      SizedBox(width: 6),
                      Text("(+1)"),
                      SizedBox(width: 6),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Spacing.medium),

              DropdownButtonFormField<String>(
                value: gender,
                decoration: InputDecoration(
                  hintText: l10n.gender,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                items: [
                  DropdownMenuItem(value: 'male', child: Text(l10n.male)),
                  DropdownMenuItem(value: 'female', child: Text(l10n.female)),
                ],
                onChanged: (value) => ref.read(genderProvider.notifier).state = value,
              ),
              const SizedBox(height: Spacing.large),

              if (profileState.error != null)
                Text(
                  profileState.error!,
                  style: TextStyle(color: colorScheme.error),
                ),
              if (profileState.isLoading)
                const CircularProgressIndicator()
              else
                PrimaryButton(
                  text: l10n.continueLabel,
                  onPressed: () {
                    profileNotifier.saveProfile(
                      fullName: fullName,
                      nickName: nickName,
                      dob: dob,
                      email: email,
                      phone: phone,
                      gender: gender,
                      image: selectedImage,
                    );
                    context.router.replaceAll([const HomeRoute()]);
                  },
                ),
              const SizedBox(height: Spacing.medium),

              TextButton(
                onPressed: () => context.router.replaceAll([const HomeRoute()]),
                child: Text(
                  l10n.skip_for_now,
                  style: TextStyle(color: colorScheme.primary),
                ),
              ),
              const SizedBox(height: Spacing.large),
            ],
          ),
        ),
      ),
    );
  }
}
