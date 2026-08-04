/// ثوابت عامة على مستوى التطبيق.
abstract final class AppConstants {
  static const String appName = 'إقرا';
  static const String appNameLatin = 'Iqra';

  /// معرّف قناة التواصل مع طبقة Native Android (Method Channel).
  static const String overlayMethodChannel = 'com.abw3laa.iqra/overlay';
  static const String screenCaptureMethodChannel =
      'com.abw3laa.iqra/screen_capture';

  static const List<String> supportedLocaleCodes = ['ar', 'en', 'tr'];
  static const String defaultLocaleCode = 'ar';

  const AppConstants._();
}
