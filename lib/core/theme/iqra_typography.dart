import 'package:flutter/material.dart';

/// عائلات الخطوط المستخدمة في التطبيق.
///
/// وفق `iqra_ux_strategy_case_study.md`: **Be Vietnam Pro** للنص اللاتيني
/// (إنجليزي/تركي) و**Noto Sans Arabic** للنص العربي. Be Vietnam Pro لا يحتوي
/// فعلياً على غليفات عربية رغم ما ورد في بعض ملاحظات DESIGN.md، لذلك تم
/// اعتماد الإزدواجية الموثّقة في دراسة الحالة كحل نهائي وصحيح تقنياً.
abstract final class IqraFontFamily {
  static const String latin = 'BeVietnamPro';
  static const String arabic = 'NotoSansArabic';

  const IqraFontFamily._();
}

/// نظام Typography الخاص بـ"إقرا"، منسوخ من `iqra_design_system/DESIGN.md`.
///
/// كل نمط نصي يُبنى بدالة تأخذ `isArabic` لاختيار عائلة الخط الصحيحة
/// تلقائياً. استخدم [IqraTypography.of] داخل الواجهات للحصول على المجموعة
/// المطابقة للّغة الحالية مباشرة من الـ [BuildContext].
class IqraTypography {
  const IqraTypography._(this.isArabic);

  final bool isArabic;

  /// يبني مجموعة الأنماط النصية المطابقة للغة الحالية في [context].
  factory IqraTypography.of(BuildContext context) {
    final languageCode = Localizations.maybeLocaleOf(context)?.languageCode;
    return IqraTypography._(languageCode == 'ar');
  }

  String get _family => isArabic ? IqraFontFamily.arabic : IqraFontFamily.latin;

  TextStyle _style({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: _family,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height / fontSize,
      letterSpacing: letterSpacing,
    );
  }

  /// display-reading — 48/60، Bold. للشاشات القليلة عالية التأثير (Splash).
  TextStyle get displayReading => _style(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 60,
        letterSpacing: -0.02 * 48,
      );

  /// headline-lg — 32/40، Bold.
  TextStyle get headlineLarge => _style(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 40,
      );

  /// headline-lg-mobile — 28/36، Bold. الافتراضي لعناوين الشاشات على الجوال.
  TextStyle get headlineLargeMobile => _style(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 36,
      );

  /// body-xl — 24/36، Regular.
  TextStyle get bodyExtraLarge => _style(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 36,
      );

  /// body-lg — 20/30، Regular. الحد الأدنى الموصى به لأي نص أساسي.
  TextStyle get bodyLarge => _style(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        height: 30,
      );

  /// label-bold — 18/24، SemiBold.
  TextStyle get labelBold => _style(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 24,
        letterSpacing: 0.01 * 18,
      );

  /// label-xl (من iqra_vision) — 24/32، SemiBold. مفيد لعناصر البطاقات الكبيرة.
  TextStyle get labelExtraLarge => _style(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 32,
      );

  /// label-md (من iqra_vision) — 18/24، SemiBold. الحد الأدنى المطلق لأي نص.
  TextStyle get labelMedium => _style(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 24,
      );
}
