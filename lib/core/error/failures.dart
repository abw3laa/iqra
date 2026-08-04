/// أنواع الفشل الموحّدة عبر طبقات التطبيق. تُستخدم بدل رمي استثناءات خام
/// في طبقة Domain حتى تبقى دوال الحالات (UseCases) قابلة للتنبؤ والاختبار.
sealed class Failure {
  const Failure(this.message);

  final String message;
}

/// فشل عام غير مصنّف (احتياطي فقط — يُفضَّل استخدام نوع أدق دائماً).
final class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'حدث خطأ غير متوقع.']);
}

/// فشل متعلق بصلاحية غير ممنوحة (Overlay / Accessibility / إلخ).
final class PermissionFailure extends Failure {
  const PermissionFailure(super.message);
}

/// فشل في طبقة استخراج النص (OCR): لم يُعثر على نص، أو فشل تحميل النموذج.
final class OcrFailure extends Failure {
  const OcrFailure(super.message);
}

/// فشل في طبقة النطق الصوتي (TTS).
final class TtsFailure extends Failure {
  const TtsFailure(super.message);
}

/// فشل في الاتصال بخدمة الذكاء الاصطناعي (شرح/ترجمة).
final class AiAssistantFailure extends Failure {
  const AiAssistantFailure(super.message);
}

/// فشل في طبقة التخزين المحلي (السجل).
final class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

/// فشل بسبب عدم توفر اتصال بالشبكة عند الحاجة لخدمة سحابية اختيارية.
final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'لا يوجد اتصال بالإنترنت.']);
}
