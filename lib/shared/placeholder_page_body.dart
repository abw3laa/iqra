import 'package:flutter/material.dart';

import '../core/theme/theme.dart';
import '../core/theme/iqra_typography.dart';

/// جسم موحّد للشاشات التي لم تُنفَّذ ميزتها بعد في هذه المرحلة (الإعدادات،
/// المساعدة، حول التطبيق...). يبقي الشاشات قابلة للتنقل والمراجعة البصرية
/// دون تكرار نفس التركيب في كل ملف.
class PlaceholderPageBody extends StatelessWidget {
  const PlaceholderPageBody({
    required this.icon,
    required this.message,
    super.key,
  });

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(IqraSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                color: IqraColors.surfaceContainerHigh,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 44, color: IqraColors.onSurfaceVariant),
            ),
            const SizedBox(height: IqraSpacing.xl),
            Text(
              message,
              style: typography.bodyLarge
                  .copyWith(color: IqraColors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
