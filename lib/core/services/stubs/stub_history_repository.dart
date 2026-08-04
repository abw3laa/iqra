import '../../error/result.dart';
import '../history_repository.dart';

/// تنفيذ في-الذاكرة مؤقت فقط — سيُستبدل بمستودع مبني على Drift في مرحلة
/// تنفيذ سجل القراءة.
class StubHistoryRepository implements HistoryRepository {
  final List<HistoryEntry> _entries = [];

  @override
  Future<Result<List<HistoryEntry>>> getAll() async =>
      Success(List.unmodifiable(_entries));

  @override
  Future<Result<HistoryEntry>> add(HistoryEntry entry) async {
    _entries.add(entry);
    return Success(entry);
  }

  @override
  Future<Result<void>> delete(String id) async {
    _entries.removeWhere((e) => e.id == id);
    return const Success(null);
  }

  @override
  Future<Result<void>> clearAll() async {
    _entries.clear();
    return const Success(null);
  }

  @override
  Stream<List<HistoryEntry>> watchAll() async* {
    yield List.unmodifiable(_entries);
  }
}
