import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/theme/iqra_typography.dart';

/// شاشة البداية — تُعرض لثوانٍ قليلة ثم تنقل المستخدم تلقائياً إلى
/// الترحيب أو الشاشة الرئيسية (المنطق الفعلي لتحديد الوجهة، مثل التحقق من
/// اكتمال الـ Onboarding، سيُضاف مع طبقة `shared_preferences` في مرحلة
/// لاحقة — هذه المرحلة تكتفي بالتنقل الثابت إلى شاشة الترحيب).
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) context.go(AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);

    return Scaffold(
      backgroundColor: IqraColors.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [IqraColors.primary, IqraColors.tertiaryContainer],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: IqraRadius.xlRadius,
              ),
              child: const Icon(
                Icons.auto_stories_rounded,
                color: Colors.white,
                size: 56,
              ),
            ),
            const SizedBox(height: IqraSpacing.xl),
            Text(
              AppConstants.appName,
              style: typography.displayReading.copyWith(
                color: IqraColors.primary,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
