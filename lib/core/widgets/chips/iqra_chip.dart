import 'package:flutter/material.dart';

import '../../theme/iqra_colors.dart';
import '../../theme/iqra_radius.dart';
import '../../theme/iqra_spacing.dart';
import '../../theme/iqra_typography.dart';

/// شريحة صغيرة (Pill) لعرض حالة أو تصنيف (مثال: "استمع"، "اشرح"، "ترجم"
/// في لوحة نتيجة القراءة).
class IqraChip extends StatelessWidget {
  const IqraChip({
    required this.label,
    super.key,
    this.icon,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final IconData? icon;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);
    final background = selected ? IqraColors.primary : IqraColors.surfaceContainer;
    final foreground = selected ? IqraColors.onPrimary : IqraColors.primary;

    return Material(
      color: Colors.transparent,
      borderRadius: IqraRadius.fullRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: IqraRadius.fullRadius,
        child: Container(
          constraints: const BoxConstraints(minHeight: IqraSpacing.touchTargetMin),
          padding: const EdgeInsets.symmetric(horizontal: IqraSpacing.lg),
          decoration: BoxDecoration(
            color: background,
            borderRadius: IqraRadius.fullRadius,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) Icon(icon, color: foreground, size: 26),
              Text(
                label,
                style: typography.labelMedium.copyWith(color: foreground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
