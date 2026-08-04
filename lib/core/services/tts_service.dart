import '../error/result.dart';

/// اللهجات المدعومة مستقبلاً (اللغة العربية فقط تملك لهجات متعددة حالياً).
enum ArabicDialect { standard, syrian, iraqi, gulf, egyptian }

/// إعدادات نطق قابلة للتخصيص من شاشة الإعدادات.
class TtsSettings {
  const TtsSettings({
    this.speechRate = 0.5,
    this.pitch = 1.0,
    this.dialect = ArabicDialect.standard,
  });

  /// سرعة القراءة، بين 0.0 (بطيء جداً) و1.0 (سريع جداً).
  final double speechRate;

  /// طبقة الصوت، بين 0.5 و2.0.
  final double pitch;
  final ArabicDialect dialect;
}

/// واجهة خدمة تحويل النص إلى كلام (Text To Speech).
///
/// **لا تنفيذ فعلي في هذه المرحلة.** التنفيذ الحقيقي سيغلّف حزمة
/// `flutter_tts` (محرك أندرويد الأصلي) في المرحلة الثانية، مع إمكانية
/// إضافة محرك سحابي اختياري بجودة أعلى لاحقاً (مثال: ElevenLabs) خلف نفس
/// الواجهة.
abstract interface class TtsService {
  bool get isSpeaking;

  Future<Result<void>> initialize();

  /// ينطق [text] بإعدادات [settings]. يُستبدل أي نطق جارٍ حالياً.
  Future<Result<void>> speak(String text, {TtsSettings settings});

  /// يوقف النطق الحالي فوراً.
  Future<Result<void>> stop();

  /// دفق حالة النطق (يبدأ/ينتهي) — مفيد لتشغيل [VoiceWaveform] في الواجهة.
  Stream<bool> get speakingStateStream;
}
