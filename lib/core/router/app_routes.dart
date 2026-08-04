/// أسماء ومسارات كل الشاشات في التطبيق — مصدر واحد للحقيقة يُستخدم من
/// [app_router.dart] ومن أي كود يحتاج للتنقل، لتفادي الأخطاء الإملائية
/// المتفرقة في السلاسل النصية.
abstract final class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String permissions = '/permissions';
  static const String home = '/home';
  static const String history = '/history';
  static const String settings = '/settings';
  static const String help = '/help';
  static const String about = '/about';

  /// شاشة معرض المكوّنات (Component Gallery) — أداة تطوير داخلية لمراجعة
  /// نظام التصميم بصرياً، وليست جزءاً من رحلة المستخدم النهائية.
  static const String componentGallery = '/dev/component-gallery';

  const AppRoutes._();
}
