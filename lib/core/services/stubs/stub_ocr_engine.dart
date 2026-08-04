import 'dart:typed_data';

import '../../error/result.dart';
import '../ocr_engine.dart';

class StubOcrEngine implements OcrEngine {
  @override
  bool get isReady => false;

  @override
  Future<Result<void>> initialize() async => const Success(null);

  @override
  Future<Result<OcrResult>> extractText(
    Uint8List imageBytes, {
    String? languageHint,
  }) async {
    return const ResultError(OcrFailure('لم يتم تنفيذ OcrEngine بعد.'));
  }

  @override
  Future<void> dispose() async {}
}
