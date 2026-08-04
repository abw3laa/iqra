import 'failures.dart';

/// نوع نتيجة خفيف الوزن يمثّل إما نجاحاً بقيمة [T] أو فشلاً بـ [Failure]،
/// بديل داخلي بسيط عن اعتماد حزمة خارجية مثل fpdart في هذه المرحلة.
///
/// الاستخدام:
/// ```dart
/// final result = await ocrEngine.extractText(image);
/// switch (result) {
///   case Success(:final value) => print(value),
///   case ResultError(:final failure) => print(failure.message),
/// }
/// ```
sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success<T>;
  const factory Result.error(Failure failure) = ResultError<T>;

  bool get isSuccess => this is Success<T>;
  bool get isError => this is ResultError<T>;

  R when<R>({
    required R Function(T value) success,
    required R Function(Failure failure) error,
  }) {
    return switch (this) {
      Success<T>(:final value) => success(value),
      ResultError<T>(:final failure) => error(failure),
    };
  }
}

final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

final class ResultError<T> extends Result<T> {
  const ResultError(this.failure);

  final Failure failure;
}
