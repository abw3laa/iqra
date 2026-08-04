import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/iqra_colors.dart';
import '../../theme/iqra_radius.dart';
import '../../theme/iqra_spacing.dart';

/// بطاقة "إقرا" الأساسية — بلا حدود صلبة، تعتمد على ظل ناعم كبير النصف قطر
/// (Ambient Occlusion) لإيهام الطفو، وفق قسم Elevation في نظام التصميم.
class IqraCard extends StatelessWidget {
  const IqraCard({
    required this.child,
    super.key,
    this.onTap,
    this.padding = const EdgeInsets.all(IqraSpacing.xl),
    this.glass = false,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  /// عندما تكون true تُطبَّق خلفية زجاجية شفافة (Glassmorphism) بدل الخلفية
  /// الصلبة — للاستخدام فوق التوضيحات أو التدرجات فقط.
  final bool glass;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: glass
            ? Colors.white.withValues(alpha: 0.7)
            : IqraColors.surfaceContainerLowest,
        borderRadius: IqraRadius.lgRadius,
        boxShadow: const [
          BoxShadow(
            color: Color(0x14111C2D), // ~8% opacity ambient shadow
            blurRadius: 40,
            offset: Offset(0, 8),
          ),
        ],
        border: glass
            ? Border.all(color: Colors.white.withValues(alpha: 0.5))
            : null,
      ),
      child: child,
    );

    final card = glass
        ? ClipRRect(
            borderRadius: IqraRadius.lgRadius,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: content,
            ),
          )
        : content;

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      borderRadius: IqraRadius.lgRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: IqraRadius.lgRadius,
        child: card,
      ),
    );
  }
}
