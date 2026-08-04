import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/generated/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/theme/iqra_typography.dart';
import '../../../../core/widgets/widgets.dart';

/// شاشة الترحيب — تعيد نفس تركيب `onboarding_welcome` من تصدير Stitch:
/// شعار كبير، عنوان ترحيبي، جملة وصف قصيرة، وزر ابدأ الآن بعرض كامل.
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: IqraColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: IqraSpacing.screenMarginHorizontal,
          ),
          child: Column(
            children: [
              const Spacer(flex: 3),
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      IqraColors.primary,
                      IqraColors.tertiaryContainer,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: IqraRadius.xlRadius,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33003FB1),
                      blurRadius: 32,
                      offset: Offset(0, 12),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.auto_stories_rounded,
                  color: Colors.white,
                  size: 72,
                ),
              ),
              const SizedBox(height: IqraSpacing.xxxl),
              Text(
                l10n.onboardingWelcomeTitle,
                style: typography.headlineLarge
                    .copyWith(color: IqraColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: IqraSpacing.sm),
              Text(
                l10n.onboardingWelcomeSubtitle,
                style: typography.bodyLarge
                    .copyWith(color: IqraColors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 4),
              IqraButton(
                label: l10n.onboardingStartButton,
                icon: Icons.arrow_back_rounded,
                onPressed: () => context.go(AppRoutes.permissions),
              ),
              const SizedBox(height: IqraSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
