import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPasswordVisible;
  final VoidCallback onToggleVisibility;
  final String hintText;
  final ColorScheme colorScheme;

  const PasswordField({
    super.key,
    required this.controller,
    required this.isPasswordVisible,
    required this.onToggleVisibility,
    required this.hintText,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outline),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: colorScheme.onSurface,
          ),
          onPressed: onToggleVisibility,
        ),
      ),
    );
  }
}
