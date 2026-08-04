import '../../error/result.dart';
import '../overlay_service.dart';

/// تنفيذ وهمي (Stub) لـ [OverlayService] — يستخدم فقط لتفعيل حقن
/// الاعتماديات وتشغيل التطبيق في مرحلة الأساس، قبل ربط قناة Native Android
/// الحقيقية في المرحلة التالية.
class StubOverlayService implements OverlayService {
  final _stateController = Stream<OverlayState>.empty();

  @override
  Future<bool> hasPermission() async => false;

  @override
  Future<Result<bool>> requestPermission() async => const Success(false);

  @override
  Future<Result<void>> show() async =>
      const ResultError(PermissionFailure('لم يتم تنفيذ OverlayService بعد.'));

  @override
  Future<Result<void>> hide() async => const Success(null);

  @override
  Stream<OverlayState> get stateStream => _stateController;

  @override
  Future<Result<void>> updatePosition({
    required double x,
    required double y,
  }) async =>
      const Success(null);
}
