import 'dart:typed_data';

import '../../error/result.dart';
import '../screen_capture_service.dart';

class StubScreenCaptureService implements ScreenCaptureService {
  @override
  bool get isCapturing => false;

  @override
  Future<Result<bool>> requestCapturePermission() async =>
      const Success(false);

  @override
  Future<Result<Uint8List>> captureRegion(CaptureRegion region) async =>
      const ResultError(OcrFailure('لم يتم تنفيذ ScreenCaptureService بعد.'));

  @override
  Future<Result<void>> stopCapture() async => const Success(null);
}
