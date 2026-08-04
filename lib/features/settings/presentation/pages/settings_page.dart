import 'package:flutter/material.dart';

import '../../../../core/l10n/generated/app_localizations.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/misc/iqra_app_bar.dart';
import '../../../../shared/placeholder_page_body.dart';

/// شاشة الإعدادات — Placeholder بصري. الخيارات الفعلية (اللغة، اللهجة،
/// سرعة القراءة...) ستُضاف عند تنفيذ [TtsService] الحقيقي.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: IqraColors.background,
      appBar: IqraAppBar(title: l10n.settingsPageTitle),
      body: PlaceholderPageBody(
        icon: Icons.settings_outlined,
        message: l10n.settingsPagePlaceholder,
      ),
    );
  }
}
