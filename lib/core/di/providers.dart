import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/ai_assistant_service.dart';
import '../services/history_repository.dart';
import '../services/ocr_engine.dart';
import '../services/overlay_service.dart';
import '../services/screen_capture_service.dart';
import '../services/stubs/stub_ai_assistant_service.dart';
import '../services/stubs/stub_history_repository.dart';
import '../services/stubs/stub_ocr_engine.dart';
import '../services/stubs/stub_overlay_service.dart';
import '../services/stubs/stub_screen_capture_service.dart';
import '../services/stubs/stub_tts_service.dart';
import '../services/tts_service.dart';

/// نقطة حقن الاعتماديات المركزية لجميع الخدمات الأساسية.
///
/// كل Provider هنا يُرجع الواجهة (Interface) لا التنفيذ، بحيث تستبدل
/// التنفيذ الوهمي (Stub) بتنفيذ حقيقي في المراحل القادمة دون تعديل أي كود
/// في طبقات الـ Features التي تستهلك هذه الـ Providers.
///
/// مثال الاستبدال لاحقاً:
/// ```dart
/// final ocrEngineProvider = Provider<OcrEngine>((ref) => HybridOcrEngine(...));
/// ```

final overlayServiceProvider = Provider<OverlayService>((ref) {
  return StubOverlayService();
});

final screenCaptureServiceProvider = Provider<ScreenCaptureService>((ref) {
  return StubScreenCaptureService();
});

final ocrEngineProvider = Provider<OcrEngine>((ref) {
  return StubOcrEngine();
});

final ttsServiceProvider = Provider<TtsService>((ref) {
  return StubTtsService();
});

final aiAssistantServiceProvider = Provider<AiAssistantService>((ref) {
  return StubAiAssistantService();
});

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  return StubHistoryRepository();
});
