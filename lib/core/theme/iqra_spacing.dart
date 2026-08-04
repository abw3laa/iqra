/// قيم التباعد (Spacing) من نظام التصميم — وحدة أساس 8px، مع احترام صارم
/// لحد أدنى 64px لمساحة اللمس (touch-target-min) لملاءمة كبار السن وضعاف
/// البصر.
abstract final class IqraSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12; // stack-sm
  static const double md = 16;
  static const double lg = 20; // margin-mobile
  static const double xl = 24; // gutter-md
  static const double xxl = 32;
  static const double xxxl = 40; // stack-lg

  /// الحد الأدنى المطلق لأي عنصر قابل للمس (زر، بطاقة تفاعلية، إلخ).
  static const double touchTargetMin = 64;

  /// هامش الشاشة الأفقي الافتراضي.
  static const double screenMarginHorizontal = 20;

  const IqraSpacing._();
}
