import 'package:flutter/material.dart';

import '../../theme/iqra_typography.dart';

/// حقل إدخال "إقرا" — ارتفاع كبير (72px+) وحشوة داخلية سخية، وفق قسم
/// Input Fields في نظام التصميم، لضمان دقة اللمس والوضوح البصري.
class IqraTextField extends StatelessWidget {
  const IqraTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.enabled = true,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);

    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      enabled: enabled,
      autofocus: autofocus,
      style: typography.bodyLarge,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: typography.bodyLarge,
      ),
    );
  }
}
