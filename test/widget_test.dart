import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter_kit/app/localization/app_strings.dart';
import 'package:flutter_mobile_starter_kit/app/preferences/app_preferences.dart';
import 'package:flutter_mobile_starter_kit/app/starter_kit_app.dart';
import 'package:flutter_mobile_starter_kit/app/theme/app_palette.dart';
import 'package:flutter_mobile_starter_kit/app/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late _MemoryPreferencesStore store;

  setUp(() {
    store = _MemoryPreferencesStore();
  });

  Widget buildTestApp() {
    return ProviderScope(
      overrides: [
        appPreferencesStoreProvider.overrideWithValue(store),
        initialAppPreferencesProvider.overrideWithValue(store.value),
      ],
      child: const StarterKitApp(),
    );
  }

  group('StarterKitApp', () {
    testWidgets('shows the mobile foundation home screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pumpAndSettle();

      expect(find.text('Quietly capable.'), findsOneWidget);
      expect(find.text('Mobile, first'), findsOneWidget);
      expect(find.text('Design system'), findsOneWidget);
      expect(find.byTooltip('App preferences'), findsOneWidget);
    });

    testWidgets('navigates to the design system showcase', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('Explore the design system'));
      await tester.pumpAndSettle();

      expect(find.text('The visual language.'), findsOneWidget);
      expect(find.text('Monochrome palette'), findsOneWidget);
      expect(find.text('Spacing rhythm'), findsOneWidget);
    });

    testWidgets('navigates to the engineering principles', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Engineering principles'));
      await tester.tap(find.text('Engineering principles'));
      await tester.pumpAndSettle();

      expect(
        find.text('Principles, not layers for their own sake.'),
        findsOneWidget,
      );
      expect(find.text('Make the easy path the good path'), findsOneWidget);
    });

    testWidgets('persists a theme preference through the store boundary', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('App preferences'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Dark'));
      await tester.tap(find.text('Dark'));
      await tester.pumpAndSettle();

      expect(store.value.themeMode, ThemeMode.dark);
      final MaterialApp app = tester.widget<MaterialApp>(
        find.byType(MaterialApp),
      );
      expect(app.themeMode, ThemeMode.dark);
    });

    testWidgets('switches language and direction to Arabic', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('App preferences'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Arabic'));
      await tester.tap(find.text('Arabic'));
      await tester.pumpAndSettle();

      expect(find.text('التفضيلات'), findsOneWidget);
      final MaterialApp app = tester.widget<MaterialApp>(
        find.byType(MaterialApp),
      );
      expect(app.locale, const Locale('ar'));
      expect(store.value.localePreference, AppLocalePreference.arabic);

      final Directionality directionality = tester.widget<Directionality>(
        find
            .ancestor(
              of: find.text('التفضيلات'),
              matching: find.byType(Directionality),
            )
            .first,
      );
      expect(directionality.textDirection, TextDirection.rtl);
    });

    testWidgets('rolls back the interface when saving a preference fails', (
      WidgetTester tester,
    ) async {
      store.failWrites = true;
      await tester.pumpWidget(buildTestApp());
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('App preferences'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Dark'));
      await tester.tap(find.text('Dark'));
      await tester.pumpAndSettle();

      expect(
        find.text('Your change could not be saved. Please try again.'),
        findsOneWidget,
      );
      final MaterialApp app = tester.widget<MaterialApp>(
        find.byType(MaterialApp),
      );
      expect(app.themeMode, ThemeMode.system);
      expect(store.value.themeMode, ThemeMode.system);
    });
  });

  group('AppTheme', () {
    test('uses a restrained monochrome primary palette', () {
      expect(AppTheme.light.colorScheme.primary, AppPalette.ink);
      expect(AppTheme.dark.colorScheme.primary, AppPalette.darkText);
      expect(AppTheme.light.brightness, Brightness.light);
      expect(AppTheme.dark.brightness, Brightness.dark);
    });

    test('supports English and Arabic without generated localization code', () {
      expect(AppStrings.supportedLocales, contains(const Locale('en')));
      expect(AppStrings.supportedLocales, contains(const Locale('ar')));
    });
  });
}

class _MemoryPreferencesStore implements AppPreferencesStore {
  AppPreferences value = const AppPreferences();
  bool failWrites = false;

  @override
  Future<AppPreferences> load() async => value;

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    if (failWrites) {
      throw StateError('Simulated storage failure');
    }
    value = value.copyWith(themeMode: mode);
  }

  @override
  Future<void> saveLocalePreference(AppLocalePreference preference) async {
    if (failWrites) {
      throw StateError('Simulated storage failure');
    }
    value = value.copyWith(localePreference: preference);
  }
}
