import 'dart:typed_data';

import '../error/result.dart';

/// منطقة مستطيلة على الشاشة يحددها المستخدم بإصبعه لالتقاطها.
class CaptureRegion {
  const CaptureRegion({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  final double left;
  final double top;
  final double width;
  final double height;
}

/// واجهة خدمة التقاط الشاشة — الجسر مع MediaProjection API على أندرويد.
///
/// **لا تنفيذ فعلي في هذه المرحلة.** يجب أن يراعي التنفيذ الحقيقي أن
/// Android 14+ يتطلب طلب صلاحية الالتقاط في كل مرة تُشغَّل فيها الخدمة من
/// جديد (لا يمكن حفظها بشكل دائم)، وأن يعمل ضمن Foreground Service من نوع
/// `mediaProjection` مع إشعار دائم إلزامي أثناء الالتقاط.
abstract interface class ScreenCaptureService {
  /// هل توجد جلسة التقاط نشطة حالياً؟
  bool get isCapturing;

  /// يطلب صلاحية MediaProjection من النظام (حوار نظام أندرويد القياسي).
  /// يجب استدعاؤها قبل كل عملية التقاط جديدة على أندرويد 14+.
  Future<Result<bool>> requestCapturePermission();

  /// يلتقط صورة للمنطقة المحددة فقط من [region]، ويعيدها كبايتات PNG.
  ///
  /// وفق مبدأ الخصوصية: يجب ألا تُخزَّن الصورة الناتجة على القرص، وأن تُمرَّر
  /// مباشرة إلى [OcrEngine] ثم تُحذف من الذاكرة فور الاستخدام.
  Future<Result<Uint8List>> captureRegion(CaptureRegion region);

  /// ينهي جلسة الالتقاط الحالية ويحرر موارد MediaProjection.
  Future<Result<void>> stopCapture();
}
