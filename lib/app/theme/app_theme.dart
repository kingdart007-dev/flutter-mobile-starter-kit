import 'package:flutter/material.dart';

import 'app_palette.dart';
import 'app_radii.dart';

abstract final class AppTheme {
  static final ThemeData light = _buildTheme(Brightness.light);
  static final ThemeData dark = _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final bool isLight = brightness == Brightness.light;
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppPalette.ink,
      brightness: brightness,
      dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
    ).copyWith(
      primary: isLight ? AppPalette.ink : AppPalette.darkText,
      onPrimary: isLight ? AppPalette.white : AppPalette.ink,
      secondary: isLight ? AppPalette.graphite : AppPalette.darkMuted,
      onSecondary: isLight ? AppPalette.white : AppPalette.ink,
      surface: isLight ? AppPalette.white : AppPalette.darkSurface,
      onSurface: isLight ? AppPalette.ink : AppPalette.darkText,
      surfaceContainerLowest:
          isLight ? AppPalette.white : AppPalette.darkSurface,
      surfaceContainerLow:
          isLight ? AppPalette.cloud : AppPalette.darkSurfaceRaised,
      surfaceContainer:
          isLight ? AppPalette.cloud : AppPalette.darkSurfaceRaised,
      surfaceContainerHigh:
          isLight ? AppPalette.mist : AppPalette.darkSurfaceHigh,
      surfaceContainerHighest:
          isLight ? AppPalette.mist : AppPalette.darkSurfaceHigh,
      outline: isLight ? AppPalette.ash : AppPalette.darkOutline,
      outlineVariant:
          isLight ? AppPalette.mist : AppPalette.darkOutline,
      surfaceTint: Colors.transparent,
      error: isLight ? AppPalette.error : AppPalette.errorDark,
    );

    final ThemeData base = ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
    );

    final TextTheme textTheme = base.textTheme.copyWith(
      displaySmall: base.textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -1.2,
        height: 1.08,
      ),
      headlineMedium: base.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.6,
        height: 1.16,
      ),
      titleLarge: base.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      titleMedium: base.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      labelLarge: base.textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ).apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    return base.copyWith(
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor:
          isLight ? AppPalette.paper : AppPalette.night,
      canvasColor: isLight ? AppPalette.paper : AppPalette.night,
      appBarTheme: AppBarTheme(
        backgroundColor: isLight ? AppPalette.paper : AppPalette.night,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.card),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.control),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.control),
          ),
          side: BorderSide(color: colorScheme.outlineVariant),
          textStyle: textTheme.labelLarge,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(48, 48),
          foregroundColor: colorScheme.onSurface,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerLow,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: _inputBorder(colorScheme.outlineVariant),
        enabledBorder: _inputBorder(colorScheme.outlineVariant),
        focusedBorder: _inputBorder(colorScheme.primary, width: 1.5),
        errorBorder: _inputBorder(colorScheme.error),
        focusedErrorBorder: _inputBorder(colorScheme.error, width: 1.5),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadii.overlay),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isLight ? AppPalette.ink : AppPalette.darkText,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: isLight ? AppPalette.white : AppPalette.ink,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.control),
        ),
      ),
    );
  }

  static OutlineInputBorder _inputBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadii.control),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
