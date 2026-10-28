import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter_kit/app/preferences/app_preferences.dart';
import 'package:flutter_mobile_starter_kit/app/router/app_router.dart';
import 'package:flutter_mobile_starter_kit/app/starter_kit_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets(
    'unknown route offers a localized recovery action back to home',
    (WidgetTester tester) async {
      final _MemoryPreferencesStore store = _MemoryPreferencesStore()
        ..value = const AppPreferences(
          localePreference: AppLocalePreference.arabic,
        );
      late GoRouter router;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appPreferencesStoreProvider.overrideWithValue(store),
            initialAppPreferencesProvider.overrideWithValue(store.value),
          ],
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              router = ref.watch(appRouterProvider);
              return const StarterKitApp();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      router.go('/missing-route');
      await tester.pumpAndSettle();

      expect(find.text('الصفحة غير متاحة'), findsOneWidget);
      expect(find.text('لم نتمكن من العثور على هذه الصفحة.'), findsOneWidget);
      expect(find.text('العودة إلى الرئيسية'), findsOneWidget);
      expect(find.byIcon(Icons.home_outlined), findsOneWidget);

      await tester.tap(find.text('العودة إلى الرئيسية'));
      await tester.pumpAndSettle();

      expect(find.text('أساس تطبيقات الهاتف'), findsOneWidget);
      expect(find.text('الصفحة غير متاحة'), findsNothing);
    },
  );
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
