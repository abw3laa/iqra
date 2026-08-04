import '../error/result.dart';

/// إدخال واحد في سجل القراءة.
class HistoryEntry {
  const HistoryEntry({
    required this.id,
    required this.sourceText,
    required this.createdAt,
    this.explanation,
    this.translation,
  });

  final String id;
  final String sourceText;
  final DateTime createdAt;
  final String? explanation;
  final String? translation;
}

/// واجهة مستودع سجل القراءة — التنفيذ الحقيقي سيعتمد على Drift (SQLite)
/// وفق المعمارية المعتمدة.
///
/// **لا تنفيذ فعلي في هذه المرحلة.** جدول Drift الفعلي والـ DAO سيُضافان
/// في مرحلة تنفيذ "سجل القراءة" القادمة.
abstract interface class HistoryRepository {
  Future<Result<List<HistoryEntry>>> getAll();

  Future<Result<HistoryEntry>> add(HistoryEntry entry);

  Future<Result<void>> delete(String id);

  Future<Result<void>> clearAll();

  /// دفق يبثّ قائمة السجل كاملة عند أي تغيير (لتحديث الواجهة تلقائياً).
  Stream<List<HistoryEntry>> watchAll();
}
