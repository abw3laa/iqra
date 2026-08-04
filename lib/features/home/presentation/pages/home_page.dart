import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/l10n/generated/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/theme/iqra_typography.dart';
import '../../../../core/widgets/widgets.dart';
import '../widgets/recent_reading_tile.dart';

/// الصفحة الرئيسية — تعيد تركيب `home_history` من تصدير Stitch. في هذه
/// المرحلة، "القراءات الأخيرة" بيانات ثابتة (Placeholder) فقط لغرض إثبات
/// المكوّن البصري؛ ستُستبدل بربط حقيقي بـ[HistoryRepository] عند تنفيذ
/// ميزة السجل.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _navIndex = 0;

  static const _placeholderReadings = [
    ('رسالة بنكية', Icons.account_balance_outlined),
    ('تعليمات دواء', Icons.medication_outlined),
  ];

  void _handleNavTap(int index) {
    setState(() => _navIndex = index);
    switch (index) {
      case 2:
        context.push(AppRoutes.history);
      case 3:
        context.push(AppRoutes.settings);
      default:
        IqraSnackbar.show(
          context,
          message: AppLocalizations.of(context)!.comingSoonMessage,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: IqraColors.background,
      appBar: IqraAppBar(
        title: AppConstants.appName,
        leadingIcon: Icons.menu_rounded,
        onLeadingTap: () => context.push(AppRoutes.help),
        trailingIcon: Icons.account_circle_outlined,
        onTrailingTap: () => context.push(AppRoutes.about),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: IqraSpacing.screenMarginHorizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: IqraSpacing.lg),
              Text(
                l10n.homeWelcomeBack,
                style: typography.bodyLarge
                    .copyWith(color: IqraColors.onSurfaceVariant),
              ),
              Text(
                l10n.homeReadyToRead,
                style: typography.headlineLarge
                    .copyWith(color: IqraColors.onSurface),
              ),
              const SizedBox(height: IqraSpacing.xxl),
              IqraCard(
                onTap: () => IqraSnackbar.show(
                  context,
                  message: l10n.comingSoonMessage,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.mic_rounded, color: IqraColors.primary),
                    const SizedBox(width: IqraSpacing.xs),
                    Text(
                      l10n.homeTapToSpeak,
                      style: typography.labelBold
                          .copyWith(color: IqraColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: IqraSpacing.xxxl),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.homeRecentReadings,
                    style: typography.headlineLargeMobile
                        .copyWith(color: IqraColors.onSurface, fontSize: 22),
                  ),
                  TextButton(
                    onPressed: () => context.push(AppRoutes.history),
                    child: Text(l10n.homeSeeAll, style: typography.labelMedium),
                  ),
                ],
              ),
              const SizedBox(height: IqraSpacing.md),
              for (final reading in _placeholderReadings) ...[
                RecentReadingTile(title: reading.$1, icon: reading.$2),
                const SizedBox(height: IqraSpacing.sm),
              ],
              const SizedBox(height: IqraSpacing.xxxl * 2),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _navIndex,
        onDestinationSelected: _handleNavTap,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.menu_book_outlined),
            label: l10n.navLibrary,
          ),
          NavigationDestination(
            icon: const Icon(Icons.mic_none_rounded),
            label: l10n.navListen,
          ),
          NavigationDestination(
            icon: const Icon(Icons.history_rounded),
            label: l10n.navHistory,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            label: l10n.navSettings,
          ),
        ],
      ),
    );
  }
}
