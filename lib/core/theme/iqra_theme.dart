import 'package:flutter/material.dart';

import 'iqra_colors.dart';
import 'iqra_radius.dart';

/// يبني [ThemeData] الكامل لتطبيق "إقرا".
///
/// ملاحظة: الأنماط النصية التفصيلية (headline/body/label) لا تُضبط هنا
/// عبر [ThemeData.textTheme] لأنها تعتمد على اللغة الحالية (عربي/لاتيني)،
/// وتُستخدم مباشرة عبر `IqraTypography.of(context)` داخل الواجهات. هذا
/// الملف يضبط فقط الألوان وأشكال المكوّنات المشتركة (أزرار، بطاقات، حقول).
abstract final class IqraTheme {
  const IqraTheme._();

  static ThemeData light() {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: IqraColors.primary,
      onPrimary: IqraColors.onPrimary,
      primaryContainer: IqraColors.primaryContainer,
      onPrimaryContainer: IqraColors.onPrimaryContainer,
      secondary: IqraColors.secondary,
      onSecondary: IqraColors.onSecondary,
      secondaryContainer: IqraColors.secondaryContainer,
      onSecondaryContainer: IqraColors.onSecondaryContainer,
      tertiary: IqraColors.tertiary,
      onTertiary: IqraColors.onTertiary,
      tertiaryContainer: IqraColors.tertiaryContainer,
      onTertiaryContainer: IqraColors.onTertiaryContainer,
      error: IqraColors.error,
      onError: IqraColors.onError,
      errorContainer: IqraColors.errorContainer,
      onErrorContainer: IqraColors.onErrorContainer,
      surface: IqraColors.surface,
      onSurface: IqraColors.onSurface,
      surfaceContainerLowest: IqraColors.surfaceContainerLowest,
      surfaceContainerLow: IqraColors.surfaceContainerLow,
      surfaceContainer: IqraColors.surfaceContainer,
      surfaceContainerHigh: IqraColors.surfaceContainerHigh,
      surfaceContainerHighest: IqraColors.surfaceContainerHighest,
      onSurfaceVariant: IqraColors.onSurfaceVariant,
      outline: IqraColors.outline,
      outlineVariant: IqraColors.outlineVariant,
      inverseSurface: IqraColors.inverseSurface,
      onInverseSurface: IqraColors.inverseOnSurface,
      inversePrimary: IqraColors.inversePrimary,
      surfaceTint: IqraColors.surfaceTint,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: IqraColors.background,
      splashFactory: InkSparkle.splashFactory,
      visualDensity: VisualDensity.standard,
      appBarTheme: const AppBarTheme(
        backgroundColor: IqraColors.background,
        foregroundColor: IqraColors.onBackground,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: IqraColors.surfaceContainerLowest,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: IqraRadius.lgRadius),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: IqraColors.primary,
          foregroundColor: IqraColors.onPrimary,
          disabledBackgroundColor: IqraColors.outlineVariant,
          minimumSize: const Size.fromHeight(64),
          shape: const RoundedRectangleBorder(
            borderRadius: IqraRadius.fullRadius,
          ),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: IqraColors.primary,
          minimumSize: const Size.fromHeight(64),
          side: const BorderSide(color: IqraColors.outlineVariant, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: IqraRadius.fullRadius,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: IqraColors.primary,
          minimumSize: const Size(64, 64),
          shape: const RoundedRectangleBorder(
            borderRadius: IqraRadius.fullRadius,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: IqraColors.surfaceContainerLowest,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        border: OutlineInputBorder(
          borderRadius: IqraRadius.lgRadius,
          borderSide: const BorderSide(color: IqraColors.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: IqraRadius.lgRadius,
          borderSide: const BorderSide(color: IqraColors.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: IqraRadius.lgRadius,
          borderSide: const BorderSide(color: IqraColors.primary, width: 2),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: IqraColors.inverseSurface,
        contentTextStyle: const TextStyle(color: IqraColors.inverseOnSurface),
        shape: RoundedRectangleBorder(borderRadius: IqraRadius.mdRadius),
        behavior: SnackBarBehavior.floating,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: IqraColors.surfaceContainerLowest,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(IqraRadius.xl)),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: IqraColors.outlineVariant,
        thickness: 1,
      ),
    );
  }
}
