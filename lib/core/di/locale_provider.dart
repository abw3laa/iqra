import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_constants.dart';

/// اللغة الحالية للتطبيق. القيمة الافتراضية العربية وفق مبدأ "Arabic First"
/// في نظام التصميم. سيُربط هذا لاحقاً بـ `shared_preferences` لحفظ اختيار
/// المستخدم بين الجلسات عند تنفيذ شاشة الإعدادات فعلياً.
final localeProvider = StateProvider<Locale>((ref) {
  return const Locale(AppConstants.defaultLocaleCode);
});
