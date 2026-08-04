import '../../error/result.dart';
import '../tts_service.dart';

class StubTtsService implements TtsService {
  @override
  bool get isSpeaking => false;

  @override
  Future<Result<void>> initialize() async => const Success(null);

  @override
  Future<Result<void>> speak(
    String text, {
    TtsSettings settings = const TtsSettings(),
  }) async {
    return const ResultError(TtsFailure('لم يتم تنفيذ TtsService بعد.'));
  }

  @override
  Future<Result<void>> stop() async => const Success(null);

  @override
  Stream<bool> get speakingStateStream => const Stream.empty();
}
