import 'package:flutter/material.dart';

import '../../theme/iqra_colors.dart';
import '../../theme/iqra_spacing.dart';
import '../../theme/iqra_typography.dart';

/// شريط علوي موحّد — أزرار دائرية كبيرة (64px) على الطرفين وعنوان مركزي،
/// وفق مكوّن Top AppBar في تصدير Stitch.
class IqraAppBar extends StatelessWidget implements PreferredSizeWidget {
  const IqraAppBar({
    required this.title,
    super.key,
    this.leadingIcon,
    this.onLeadingTap,
    this.trailingIcon,
    this.onTrailingTap,
  });

  final String title;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingTap;
  final IconData? trailingIcon;
  final VoidCallback? onTrailingTap;

  @override
  Size get preferredSize => const Size.fromHeight(IqraSpacing.touchTargetMin + 16);

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);

    return SafeArea(
      child: SizedBox(
        height: preferredSize.height,
        child: Row(
          children: [
            const SizedBox(width: IqraSpacing.lg),
            _CircleIconButton(icon: leadingIcon, onTap: onLeadingTap),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: typography.headlineLargeMobile
                    .copyWith(color: IqraColors.primary),
              ),
            ),
            _CircleIconButton(icon: trailingIcon, onTap: onTrailingTap),
            const SizedBox(width: IqraSpacing.lg),
          ],
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({this.icon, this.onTap});

  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return const SizedBox(width: IqraSpacing.touchTargetMin);
    }
    return SizedBox(
      width: IqraSpacing.touchTargetMin,
      height: IqraSpacing.touchTargetMin,
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: IqraColors.primary, size: 28),
      ),
    );
  }
}
