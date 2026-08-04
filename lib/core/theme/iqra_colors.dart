import 'package:flutter/material.dart';

/// ألوان نظام التصميم لتطبيق "إقرا".
///
/// القيم منسوخة حرفياً من ملف `iqra_design_system/DESIGN.md` المعتمد
/// (تصدير Stitch)، وليست من "Iqra Vision" البديل غير المعتمد.
/// لا تُعدَّل هذه القيم يدوياً دون تحديث الوثيقة المصدر أولاً.
abstract final class IqraColors {
  // --- Surfaces ---------------------------------------------------------
  static const Color surface = Color(0xFFF9F9FF);
  static const Color surfaceDim = Color(0xFFCFDAF2);
  static const Color surfaceBright = Color(0xFFF9F9FF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF0F3FF);
  static const Color surfaceContainer = Color(0xFFE7EEFF);
  static const Color surfaceContainerHigh = Color(0xFFDEE8FF);
  static const Color surfaceContainerHighest = Color(0xFFD8E3FB);
  static const Color surfaceVariant = Color(0xFFD8E3FB);

  static const Color onSurface = Color(0xFF111C2D);
  static const Color onSurfaceVariant = Color(0xFF434654);

  static const Color inverseSurface = Color(0xFF263143);
  static const Color inverseOnSurface = Color(0xFFECF1FF);

  static const Color outline = Color(0xFF737686);
  static const Color outlineVariant = Color(0xFFC3C5D7);

  static const Color background = Color(0xFFF9F9FF);
  static const Color onBackground = Color(0xFF111C2D);

  // --- Primary (Reading Blue) --------------------------------------------
  static const Color surfaceTint = Color(0xFF1353D8);
  static const Color primary = Color(0xFF003FB1);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF1A56DB);
  static const Color onPrimaryContainer = Color(0xFFD4DCFF);
  static const Color inversePrimary = Color(0xFFB5C4FF);

  static const Color primaryFixed = Color(0xFFDBE1FF);
  static const Color primaryFixedDim = Color(0xFFB5C4FF);
  static const Color onPrimaryFixed = Color(0xFF00174D);
  static const Color onPrimaryFixedVariant = Color(0xFF003DAB);

  // --- Secondary (Human Warmth) -------------------------------------------
  static const Color secondary = Color(0xFF855316);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFFFBC76);
  static const Color onSecondaryContainer = Color(0xFF79490B);

  static const Color secondaryFixed = Color(0xFFFFDCBD);
  static const Color secondaryFixedDim = Color(0xFFFCB973);
  static const Color onSecondaryFixed = Color(0xFF2C1600);
  static const Color onSecondaryFixedVariant = Color(0xFF683C00);

  // --- Tertiary ------------------------------------------------------------
  static const Color tertiary = Color(0xFF004A87);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFF0062B0);
  static const Color onTertiaryContainer = Color(0xFFCADEFF);

  static const Color tertiaryFixed = Color(0xFFD4E3FF);
  static const Color tertiaryFixedDim = Color(0xFFA4C9FF);
  static const Color onTertiaryFixed = Color(0xFF001C39);
  static const Color onTertiaryFixedVariant = Color(0xFF004883);

  // --- Error -----------------------------------------------------------
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  // --- Functional feedback (من iqra_vision، مفيدة للنجاح/الفشل فقط) -------
  static const Color successVibrant = Color(0xFF059669);
  static const Color errorVibrant = Color(0xFFDC2626);

  // --- Voice feedback gradient ------------------------------------------
  static const Color voicePulseStart = Color(0xFF1A56DB);
  static const Color voicePulseEnd = Color(0xFF60A5FA);

  const IqraColors._();
}
