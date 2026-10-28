import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter_kit/app/preferences/app_preferences.dart';
import 'package:flutter_mobile_starter_kit/app/starter_kit_app.dart';
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

  testWidgets('system back returns from settings to the previous route', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('App preferences'));
    await tester.pumpAndSettle();
    expect(find.text('Make it yours.'), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(find.text('Quietly capable.'), findsOneWidget);
    expect(find.text('Make it yours.'), findsNothing);
  });

  testWidgets('system back unwinds nested routes one level at a time', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Explore the design system'));
    await tester.pumpAndSettle();
    expect(find.text('The visual language.'), findsOneWidget);

    await tester.ensureVisible(find.text('Primary action'));
    await tester.tap(find.text('Primary action'));
    await tester.pumpAndSettle();
    expect(
      find.text('Principles, not layers for their own sake.'),
      findsOneWidget,
    );

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.text('The visual language.'), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.text('Quietly capable.'), findsOneWidget);
  });

  testWidgets('back navigation preserves Arabic locale and RTL direction', (
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
    expect(store.value.localePreference, AppLocalePreference.arabic);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(find.text('أساس تطبيقات الهاتف'), findsOneWidget);
    expect(find.text('التفضيلات'), findsNothing);

    final Directionality directionality = tester.widget<Directionality>(
      find
          .ancestor(
            of: find.text('أساس تطبيقات الهاتف'),
            matching: find.byType(Directionality),
          )
          .first,
    );
    expect(directionality.textDirection, TextDirection.rtl);
    expect(store.value.localePreference, AppLocalePreference.arabic);
  });
}

class _MemoryPreferencesStore implements AppPreferencesStore {
  AppPreferences value = const AppPreferences();

  @override
  Future<AppPreferences> load() async => value;

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    value = value.copyWith(themeMode: mode);
  }

  @override
  Future<void> saveLocalePreference(AppLocalePreference preference) async {
    value = value.copyWith(localePreference: preference);
  }
}
