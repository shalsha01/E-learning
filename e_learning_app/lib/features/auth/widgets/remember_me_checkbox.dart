import 'package:flutter/material.dart';

class RememberMeCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final ColorScheme colorScheme;

  const RememberMeCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          side: BorderSide(color: colorScheme.primary, width: 2.0),
          activeColor: colorScheme.primary,
          checkColor: colorScheme.onPrimary,
        ),
        Text(
          label,
          style: TextStyle(color: colorScheme.onSurface),
        ),
      ],
    );
  }
}
