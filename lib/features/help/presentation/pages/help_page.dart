import 'package:flutter/material.dart';

import '../../../../core/l10n/generated/app_localizations.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/misc/iqra_app_bar.dart';
import '../../../../shared/placeholder_page_body.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: IqraColors.background,
      appBar: IqraAppBar(title: l10n.helpPageTitle),
      body: PlaceholderPageBody(
        icon: Icons.help_outline_rounded,
        message: l10n.helpPagePlaceholder,
      ),
    );
  }
}
