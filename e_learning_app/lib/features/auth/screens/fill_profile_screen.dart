import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:e_learning_app/l10n/app_localizations.dart';
import 'package:riverpod_hook_mutation/riverpod_hook_mutation.dart';

import 'package:e_learning_app/core/theme/spacing.dart';
import 'package:e_learning_app/features/router/app_router.dart';
import 'package:e_learning_app/core/widgets/primary_button.dart';

@RoutePage()
class FillProfilePage extends HookWidget {
  const FillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final fullName = useTextEditingController();
    final nickName = useTextEditingController();
    final dob = useTextEditingController();
    final email = useTextEditingController();
    final phone = useTextEditingController();
    final gender = useState<String?>(null);
    final selectedImage = useState<File?>(null);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final mutation = useMutation<UserModel>();


    Future<void> pickImage() async {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) {
        selectedImage.value = File(picked.path);
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
        dob.text = DateFormat('yyyy-MM-dd').format(pickedDate);
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: Spacing.large),
           
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
              
                      backgroundColor: colorScheme.primary.withOpacity(0.1),
                      backgroundImage: selectedImage.value != null
                          ? FileImage(selectedImage.value!)
                          : null,
                      child: selectedImage.value == null
                          ? Icon(Icons.person, size: 50, color: colorScheme.primary)
                          : null,
                    ),
                    InkWell(
                      onTap: pickImage,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: colorScheme.secondary,
                        child: Icon(Icons.edit, size: 16, color: colorScheme.onPrimary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.large),

           
                TextFormField(
                  controller: fullName,
                  decoration: InputDecoration(
                    hintText: l10n.full_name,
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? l10n.full_name_required : null,
                ),
                const SizedBox(height: Spacing.medium),

            
                TextFormField(
                  controller: nickName,
                  decoration: InputDecoration(
                    hintText: l10n.nick_name,
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? l10n.nick_name_required : null,
                ),
                const SizedBox(height: Spacing.medium),

           
                GestureDetector(
                  onTap: pickDate,
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: dob,
                      decoration: InputDecoration(
                        hintText: l10n.dob,
                        prefixIcon: const Icon(Icons.date_range),
                      ),
                      validator: (value) =>
                          value == null || value.isEmpty ? l10n.dob_required : null,
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.medium),

      
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: l10n.email,
                    prefixIcon: const Icon(Icons.email),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? l10n.email_required : null,
                ),
                const SizedBox(height: Spacing.medium),

            
                TextFormField(
                  controller: phone,
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
                  validator: (value) =>
                      value == null || value.isEmpty ? l10n.phone_required : null,
                ),
                const SizedBox(height: Spacing.medium),

          
                DropdownButtonFormField<String>(
                  value: gender.value,
                  decoration: InputDecoration(
                    hintText: l10n.gender,
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  items: [
                    DropdownMenuItem(value: 'male', child: Text(l10n.male)),
                    DropdownMenuItem(value: 'female', child: Text(l10n.female)),
                  ],
                  onChanged: (value) => gender.value = value,
                  validator: (value) =>
                      value == null ? l10n.gender_required : null,
                ),
                const SizedBox(height: Spacing.large),

                PrimaryButton(
                  text: l10n.continueLabel,
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context.router.replaceAll([const CreatePinRoute()]);
                    }
                  },
                ),
                mutation.isLoading
                    ? const CircularProgressIndicator()
                    : const SizedBox.shrink(),
                const SizedBox(height: Spacing.medium),

                TextButton(
                  onPressed: () => context.router.replaceAll([const CreatePinRoute()]),
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
      ),
    );
  }
}
