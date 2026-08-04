import 'package:flutter/material.dart';

import '../../theme/iqra_colors.dart';
import '../../theme/iqra_spacing.dart';

/// غلاف موحّد لعرض الـ Bottom Sheets في التطبيق (يُستخدم لاحقاً لعرض نتيجة
/// القراءة: استمع/اشرح/ترجم). يضيف مقبض السحب العلوي تلقائياً.
abstract final class IqraBottomSheet {
  const IqraBottomSheet._();

  static Future<T?> show<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: IqraColors.surfaceContainerLowest,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(IqraSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: IqraSpacing.lg),
                decoration: BoxDecoration(
                  color: IqraColors.outlineVariant,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              builder(context),
            ],
          ),
        ),
      ),
    );
  }
}
