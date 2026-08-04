import 'package:flutter/widgets.dart';

/// دوال مساعدة متعلقة باتجاه النص (RTL/LTR). Flutter يتعامل تلقائياً مع
/// اتجاه الواجهة بناءً على [Locale] عبر [Localizations]، لكن بعض الحالات
/// (مثل أيقونات اتجاهية مخصصة لا تتبع `Directionality` تلقائياً) تحتاج
/// تحققاً صريحاً — توضع هنا مركزياً بدل تكرار المنطق في كل شاشة.
abstract final class RtlUtils {
  const RtlUtils._();

  static bool isRtl(BuildContext context) {
    return Directionality.of(context) == TextDirection.rtl;
  }

  /// يعكس قيمة أفقية (مثال: إزاحة X لموضع الزر العائم المحفوظ) عند العمل
  /// ضمن سياق RTL، مفيد عند تخزين مواضع مطلقة على الشاشة.
  static double mirrorIfRtl(BuildContext context, double value, double maxWidth) {
    return isRtl(context) ? maxWidth - value : value;
  }
}
