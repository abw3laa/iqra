import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/generated/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/theme/iqra_typography.dart';
import '../../../../core/widgets/widgets.dart';

/// شاشة طلب الصلاحيات — تعيد تركيب `permissions_setup` من Stitch: توضيح
/// الحاجة، ثم صفّي تبديل لصلاحيتي "الظهور فوق التطبيقات" و"قراءة محتوى
/// الشاشة"، وزر متابعة.
///
/// **ملاحظة Phase 1:** المفاتيح هنا تعرض حالة محلية فقط داخل الشاشة؛ الربط
/// الفعلي بـ `permission_handler` و[OverlayService] الحقيقي سيتم في مرحلة
/// تنفيذ الخدمات القادمة.
class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  bool _overlayEnabled = false;
  bool _screenReadingEnabled = false;

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: IqraColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: IqraSpacing.screenMarginHorizontal,
          ),
          child: Column(
            children: [
              const SizedBox(height: IqraSpacing.xl),
              Container(
                width: 96,
                height: 96,
                decoration: const BoxDecoration(
                  color: IqraColors.primaryFixed,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shield_moon_rounded,
                  color: IqraColors.primary,
                  size: 44,
                ),
              ),
              const SizedBox(height: IqraSpacing.xl),
              Text(
                l10n.permissionsTitle,
                style: typography.headlineLargeMobile
                    .copyWith(color: IqraColors.onSurface),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: IqraSpacing.sm),
              Text(
                l10n.permissionsSubtitle,
                style: typography.bodyLarge
                    .copyWith(color: IqraColors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: IqraSpacing.xxxl),
              IqraToggleRow(
                title: l10n.permissionsOverlayTitle,
                description: l10n.permissionsOverlayDescription,
                icon: Icons.layers_outlined,
                value: _overlayEnabled,
                onChanged: (v) => setState(() => _overlayEnabled = v),
              ),
              const SizedBox(height: IqraSpacing.md),
              IqraToggleRow(
                title: l10n.permissionsScreenReadingTitle,
                description: l10n.permissionsScreenReadingDescription,
                icon: Icons.visibility_outlined,
                value: _screenReadingEnabled,
                onChanged: (v) => setState(() => _screenReadingEnabled = v),
              ),
              const SizedBox(height: IqraSpacing.xxxl),
              IqraButton(
                label: l10n.permissionsContinueButton,
                icon: Icons.arrow_back_rounded,
                onPressed: () => context.go(AppRoutes.home),
              ),
              const SizedBox(height: IqraSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
