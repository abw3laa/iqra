import 'package:flutter/material.dart';

import '../../theme/iqra_colors.dart';
import '../../theme/iqra_radius.dart';
import '../../theme/iqra_spacing.dart';
import '../../theme/iqra_typography.dart';

enum IqraButtonVariant { primary, secondary, outlined, text }

/// زر "إقرا" الأساسي — دائماً على شكل حبة دواء (Pill)، بارتفاع لا يقل عن
/// [IqraSpacing.touchTargetMin] لضمان سهولة اللمس لكبار السن، مع حالة ضغط
/// فيزيائية (تصغير خفيف) وفق مبدأ "Depth Displacement" في نظام التصميم.
class IqraButton extends StatefulWidget {
  const IqraButton({
    required this.label,
    super.key,
    this.onPressed,
    this.variant = IqraButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IqraButtonVariant variant;
  final IconData? icon;
  final bool isLoading;

  /// إذا كانت true (الافتراضي) يمتد الزر بعرض العنصر الأب.
  final bool expand;

  @override
  State<IqraButton> createState() => _IqraButtonState();
}

class _IqraButtonState extends State<IqraButton> {
  bool _pressed = false;

  bool get _enabled => widget.onPressed != null && !widget.isLoading;

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);
    final colors = _resolveColors();

    final child = AnimatedScale(
      scale: _pressed ? 0.98 : 1.0,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      child: Container(
        height: IqraSpacing.touchTargetMin,
        width: widget.expand ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: IqraSpacing.xl),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: IqraRadius.fullRadius,
          border: colors.borderColor != null
              ? Border.all(color: colors.borderColor!, width: 1.5)
              : null,
        ),
        child: widget.isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: colors.foreground,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null) ...[
                    Icon(widget.icon, color: colors.foreground, size: 24),
                    const SizedBox(width: IqraSpacing.xs),
                  ],
                  Flexible(
                    child: Text(
                      widget.label,
                      style: typography.labelBold.copyWith(
                        color: colors.foreground,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
      ),
    );

    return Semantics(
      button: true,
      enabled: _enabled,
      label: widget.label,
      child: GestureDetector(
        onTapDown: _enabled ? (_) => setState(() => _pressed = true) : null,
        onTapUp: _enabled ? (_) => setState(() => _pressed = false) : null,
        onTapCancel: _enabled ? () => setState(() => _pressed = false) : null,
        onTap: _enabled ? widget.onPressed : null,
        child: Opacity(opacity: _enabled ? 1 : 0.5, child: child),
      ),
    );
  }

  _ButtonColors _resolveColors() {
    switch (widget.variant) {
      case IqraButtonVariant.primary:
        return const _ButtonColors(
          background: IqraColors.primary,
          foreground: IqraColors.onPrimary,
        );
      case IqraButtonVariant.secondary:
        return const _ButtonColors(
          background: IqraColors.secondaryContainer,
          foreground: IqraColors.onSecondaryContainer,
        );
      case IqraButtonVariant.outlined:
        return const _ButtonColors(
          background: Colors.transparent,
          foreground: IqraColors.primary,
          borderColor: IqraColors.outlineVariant,
        );
      case IqraButtonVariant.text:
        return const _ButtonColors(
          background: Colors.transparent,
          foreground: IqraColors.primary,
        );
    }
  }
}

class _ButtonColors {
  const _ButtonColors({
    required this.background,
    required this.foreground,
    this.borderColor,
  });

  final Color background;
  final Color foreground;
  final Color? borderColor;
}
