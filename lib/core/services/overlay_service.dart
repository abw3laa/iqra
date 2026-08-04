import '../error/result.dart';

/// حالة الزر العائم.
enum OverlayState { hidden, idle, listening, processing }

/// واجهة خدمة الزر العائم (Floating Button) — الجسر بين Flutter وطبقة
/// Native Android (Overlay Window / SYSTEM_ALERT_WINDOW).
///
/// **لا تنفيذ فعلي في هذه المرحلة.** التنفيذ الحقيقي سيربط هذه الواجهة
/// بقناة Method Channel باسم `com.abw3laa.iqra/overlay` المُعرَّفة في
/// `MainActivity.kt`، ويُسجَّل عبر `overlayServiceProvider` في مرحلة لاحقة.
abstract interface class OverlayService {
  /// هل صلاحية "الظهور فوق التطبيقات" ممنوحة حالياً؟
  Future<bool> hasPermission();

  /// يطلب من المستخدم منح صلاحية الظهور فوق التطبيقات (ينقله إلى إعدادات
  /// النظام عند الحاجة).
  Future<Result<bool>> requestPermission();

  /// يعرض الزر العائم فوق التطبيقات الأخرى.
  Future<Result<void>> show();

  /// يخفي الزر العائم.
  Future<Result<void>> hide();

  /// دفق حالة الزر العائم الحالية (لعرضها في الصفحة الرئيسية مثلاً).
  Stream<OverlayState> get stateStream;

  /// يحدّث موضع الزر العائم (بعد سحبه من المستخدم).
  Future<Result<void>> updatePosition({required double x, required double y});
}
