import 'dart:typed_data';

import '../error/result.dart';

/// مصدر محرك OCR الذي أنتج النتيجة — مفيد لعرضه في واجهة المستخدم أو
/// لتسجيله في السجل (مثال: "تم التعرف محلياً" مقابل "تم تحسين الدقة سحابياً").
enum OcrSource { local, cloud }

/// نتيجة استخراج نص واحدة.
class OcrResult {
  const OcrResult({
    required this.text,
    required this.confidence,
    required this.source,
  });

  final String text;

  /// درجة الثقة بين 0 و1. تُستخدم لتقرير ما إذا كانت طبقة السحابة
  /// الاختيارية يجب أن تُستدعى لتحسين الدقة (وفق موافقة المستخدم).
  final double confidence;
  final OcrSource source;
}

/// واجهة محرك التعرف الضوئي على النصوص (OCR).
///
/// وفق دراسة المقارنة المعتمدة: التنفيذ الافتراضي سيكون **PaddleOCR محلياً
/// عبر ONNX Runtime** (نموذج عربي مخصص)، مع طبقة سحابية اختيارية
/// (Google Cloud Vision أو Azure AI Vision) تُفعَّل فقط بموافقة صريحة من
/// المستخدم أو عند انخفاض درجة الثقة المحلية.
///
/// **لا تنفيذ فعلي في هذه المرحلة** — هذه الواجهة فقط، بنمط Strategy، بحيث
/// يمكن حقن أي تطبيق (`LocalPaddleOcrEngine`, `CloudVisionOcrEngine`,
/// `HybridOcrEngine`) لاحقاً دون تغيير طبقات الاستدعاء الأعلى.
abstract interface class OcrEngine {
  /// هل المحرك جاهز للاستخدام (مثال: نماذج ONNX محمَّلة في الذاكرة)؟
  bool get isReady;

  /// يهيئ المحرك (تحميل النماذج المحلية إلخ). يُستدعى مرة واحدة عند بدء
  /// أول استخدام لتفادي بطء الإطلاق الأول لاحقاً دون داعٍ.
  Future<Result<void>> initialize();

  /// يستخرج النص من صورة (بايتات PNG/JPEG) بلغة [languageHint] إن وُجدت
  /// (مثال: 'ar').
  Future<Result<OcrResult>> extractText(
    Uint8List imageBytes, {
    String? languageHint,
  });

  /// يحرر موارد المحرك (النماذج المحمَّلة في الذاكرة).
  Future<void> dispose();
}
