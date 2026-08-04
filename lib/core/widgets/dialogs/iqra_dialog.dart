import 'package:flutter/material.dart';

import '../../theme/iqra_colors.dart';
import '../../theme/iqra_radius.dart';
import '../../theme/iqra_spacing.dart';
import '../../theme/iqra_typography.dart';
import '../buttons/iqra_button.dart';

/// نافذة حوار "إقرا" — عنوان كبير واضح + رسالة + إجراء أساسي واحد بارز
/// (وإجراء ثانوي اختياري)، تفادياً لإرهاق المستخدم بخيارات متعددة.
class IqraDialog extends StatelessWidget {
  const IqraDialog({
    required this.title,
    required this.message,
    required this.primaryActionLabel,
    super.key,
    this.onPrimaryAction,
    this.secondaryActionLabel,
    this.onSecondaryAction,
    this.icon,
  });

  final String title;
  final String message;
  final String primaryActionLabel;
  final VoidCallback? onPrimaryAction;
  final String? secondaryActionLabel;
  final VoidCallback? onSecondaryAction;
  final IconData? icon;

  /// طريقة مختصرة لعرض الحوار عبر `showDialog`.
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    required String primaryActionLabel,
    VoidCallback? onPrimaryAction,
    String? secondaryActionLabel,
    VoidCallback? onSecondaryAction,
    IconData? icon,
  }) {
    return showDialog<void>(
      context: context,
      builder: (_) => IqraDialog(
        title: title,
        message: message,
        primaryActionLabel: primaryActionLabel,
        onPrimaryAction: onPrimaryAction,
        secondaryActionLabel: secondaryActionLabel,
        onSecondaryAction: onSecondaryAction,
        icon: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);

    return Dialog(
      backgroundColor: IqraColors.surfaceContainerLowest,
      shape: const RoundedRectangleBorder(borderRadius: IqraRadius.xlRadius),
      insetPadding: const EdgeInsets.symmetric(horizontal: IqraSpacing.xl),
      child: Padding(
        padding: const EdgeInsets.all(IqraSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: IqraColors.primaryFixed,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: IqraColors.primary, size: 32),
              ),
              const SizedBox(height: IqraSpacing.lg),
            ],
            Text(
              title,
              style: typography.headlineLargeMobile
                  .copyWith(color: IqraColors.onSurface),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: IqraSpacing.sm),
            Text(
              message,
              style: typography.bodyLarge
                  .copyWith(color: IqraColors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: IqraSpacing.xl),
            IqraButton(
              label: primaryActionLabel,
              onPressed: onPrimaryAction ?? () => Navigator.of(context).pop(),
            ),
            if (secondaryActionLabel != null) ...[
              const SizedBox(height: IqraSpacing.xs),
              IqraButton(
                label: secondaryActionLabel!,
                variant: IqraButtonVariant.text,
                onPressed:
                    onSecondaryAction ?? () => Navigator.of(context).pop(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
