import '../error/result.dart';

/// أوضاع مساعد الذكاء الاصطناعي المطابقة لوضعي "الشرح" و"الترجمة" في
/// الوثيقة الأصلية.
enum AiAssistantMode { explain, translate, summarize }

class AiAssistantRequest {
  const AiAssistantRequest({
    required this.sourceText,
    required this.mode,
    this.targetLanguageCode,
  });

  final String sourceText;
  final AiAssistantMode mode;

  /// مطلوب فقط عندما يكون [mode] هو [AiAssistantMode.translate].
  final String? targetLanguageCode;
}

class AiAssistantResponse {
  const AiAssistantResponse({required this.resultText});

  final String resultText;
}

/// واجهة خدمة المساعد الذكي — طبقة سحابية اختيارية بالكامل وفق مبدأ
/// "الخصوصية أولاً": لا تُستدعى هذه الخدمة إطلاقاً دون موافقة صريحة مسبقة
/// من المستخدم على إرسال النص المستخرج إلى خدمة خارجية.
///
/// **لا تنفيذ فعلي في هذه المرحلة.** لاحقاً ستُغلِّف نموذج لغوي (عبر Dio)
/// لتبسيط النصوص وترجمتها وتلخيصها.
abstract interface class AiAssistantService {
  /// هل المستخدم وافق على استخدام هذه الخدمة السحابية؟ يجب التحقق من هذا
  /// دائماً قبل استدعاء [process] من طبقات أعلى.
  Future<bool> hasUserConsent();

  Future<Result<AiAssistantResponse>> process(AiAssistantRequest request);
}
