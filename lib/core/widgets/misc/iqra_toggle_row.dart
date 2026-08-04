import 'package:flutter/material.dart';

import '../../theme/iqra_colors.dart';
import '../../theme/iqra_radius.dart';
import '../../theme/iqra_spacing.dart';
import '../../theme/iqra_typography.dart';

/// صف تبديل بأسلوب شاشة الصلاحيات (permissions_setup) — أيقونة + عنوان +
/// وصف + مفتاح تبديل، بارتفاع لمس مريح.
class IqraToggleRow extends StatelessWidget {
  const IqraToggleRow({
    required this.title,
    required this.description,
    required this.icon,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);

    return Container(
      padding: const EdgeInsets.all(IqraSpacing.lg),
      decoration: BoxDecoration(
        color: IqraColors.surfaceContainerLowest,
        borderRadius: IqraRadius.lgRadius,
        boxShadow: const [
          BoxShadow(
            color: Color(0x14111C2D),
            blurRadius: 24,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Switch(value: value, onChanged: onChanged),
          const SizedBox(width: IqraSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: typography.labelBold
                      .copyWith(color: IqraColors.onSurface),
                ),
                const SizedBox(height: IqraSpacing.xxs),
                Text(
                  description,
                  style: typography.labelMedium.copyWith(
                    color: IqraColors.onSurfaceVariant,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: IqraSpacing.md),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: IqraColors.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: IqraColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
