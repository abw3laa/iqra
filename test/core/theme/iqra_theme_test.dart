import 'package:flutter_test/flutter_test.dart';
import 'package:iqra/core/theme/theme.dart';

void main() {
  group('IqraTheme', () {
    test('light() builds a valid Material 3 ColorScheme', () {
      final theme = IqraTheme.light();

      expect(theme.useMaterial3, isTrue);
      expect(theme.colorScheme.primary, IqraColors.primary);
      expect(theme.colorScheme.brightness.name, 'light');
    });
  });

  group('IqraSpacing', () {
    test('touchTargetMin meets the 64px accessibility minimum', () {
      expect(IqraSpacing.touchTargetMin, greaterThanOrEqualTo(64));
    });
  });
}
