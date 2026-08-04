import 'package:flutter/widgets.dart';

/// قيم الانحناء (Border Radius) — لغة الأشكال "Ultra-Rounded" المعتمدة.
/// الحد الأدنى لأي عنصر بصري هو 16px (sm)، والبطاقات والحاويات الرئيسية
/// تستخدم 24-32px كافتراضي.
abstract final class IqraRadius {
  static const double sm = 8;
  static const double md = 16; // DEFAULT
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double full = 9999;

  static const BorderRadius smRadius = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdRadius = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgRadius = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlRadius = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius fullRadius =
      BorderRadius.all(Radius.circular(full));

  const IqraRadius._();
}
