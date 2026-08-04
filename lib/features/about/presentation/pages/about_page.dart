import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/l10n/generated/app_localizations.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/misc/iqra_app_bar.dart';
import '../../../../shared/placeholder_page_body.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: IqraColors.background,
      appBar: IqraAppBar(title: l10n.aboutPageTitle),
      body: PlaceholderPageBody(
        icon: Icons.info_outline_rounded,
        message: '${AppConstants.appName}\n${l10n.aboutPagePlaceholder}',
      ),
    );
  }
}
