import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/theme/iqra_typography.dart';
import '../../../../core/widgets/cards/iqra_card.dart';

/// بطاقة قراءة أخيرة واحدة في الصفحة الرئيسية — أيقونة دائرية + عنوان +
/// زر تشغيل، وفق تصميم `home_history` من Stitch.
class RecentReadingTile extends StatelessWidget {
  const RecentReadingTile({
    required this.title,
    required this.icon,
    super.key,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);

    return IqraCard(
      onTap: onTap,
      padding: const EdgeInsets.all(IqraSpacing.md),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: IqraColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: IqraColors.onPrimary),
          ),
          const SizedBox(width: IqraSpacing.md),
          Expanded(
            child: Text(
              title,
              style:
                  typography.labelBold.copyWith(color: IqraColors.onSurface),
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: IqraColors.primaryFixed,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: IqraColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
