import '../../error/result.dart';
import '../ai_assistant_service.dart';

class StubAiAssistantService implements AiAssistantService {
  @override
  Future<bool> hasUserConsent() async => false;

  @override
  Future<Result<AiAssistantResponse>> process(
    AiAssistantRequest request,
  ) async {
    return const ResultError(
      AiAssistantFailure('لم يتم تنفيذ AiAssistantService بعد.'),
    );
  }
}
