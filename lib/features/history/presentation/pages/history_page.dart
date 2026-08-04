import 'package:flutter/material.dart';

import '../../../../core/l10n/generated/app_localizations.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/misc/iqra_app_bar.dart';
import '../../../../shared/placeholder_page_body.dart';

/// شاشة سجل القراءة — Placeholder بصري فقط في مرحلة الأساس. سيُبنى
/// المحتوى الفعلي عند تنفيذ [HistoryRepository] الحقيقي.
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: IqraColors.background,
      appBar: IqraAppBar(title: l10n.historyPageTitle),
      body: PlaceholderPageBody(
        icon: Icons.history_rounded,
        message: l10n.historyPagePlaceholder,
      ),
    );
  }
}
