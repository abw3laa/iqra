import 'package:flutter/material.dart';

import '../../theme/iqra_colors.dart';

enum IqraSnackbarType { info, success, error }

/// أشرطة تنبيه موحّدة — تُستخدم فقط للنجاح/الفشل وفق مبدأ "Feedback Toasts"
/// في نظام التصميم (لا إشعارات زائدة).
abstract final class IqraSnackbar {
  const IqraSnackbar._();

  static void show(
    BuildContext context, {
    required String message,
    IqraSnackbarType type = IqraSnackbarType.info,
  }) {
    final color = switch (type) {
      IqraSnackbarType.success => IqraColors.successVibrant,
      IqraSnackbarType.error => IqraColors.errorVibrant,
      IqraSnackbarType.info => IqraColors.inverseSurface,
    };

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
  }
}
