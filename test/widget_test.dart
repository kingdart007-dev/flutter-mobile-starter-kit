import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter_kit/app/starter_kit_app.dart';
import 'package:flutter_mobile_starter_kit/app/theme/app_palette.dart';
import 'package:flutter_mobile_starter_kit/app/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StarterKitApp', () {
    testWidgets('shows the mobile foundation home screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const ProviderScope(child: StarterKitApp()),
      );
      await tester.pumpAndSettle();

      expect(find.text('Quietly capable.'), findsOneWidget);
      expect(find.text('Mobile, first'), findsOneWidget);
      expect(find.text('Design system'), findsOneWidget);
    });

    testWidgets('navigates to the design system showcase', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const ProviderScope(child: StarterKitApp()),
      );
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Design system'));
      await tester.tap(find.text('Design system'));
      await tester.pumpAndSettle();

      expect(find.text('The visual language.'), findsOneWidget);
      expect(find.text('Monochrome palette'), findsOneWidget);
      expect(find.text('Spacing rhythm'), findsOneWidget);
    });

    testWidgets('navigates to the engineering principles', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const ProviderScope(child: StarterKitApp()),
      );
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
  });

  group('AppTheme', () {
    test('uses a restrained monochrome primary palette', () {
      expect(AppTheme.light.colorScheme.primary, AppPalette.ink);
      expect(AppTheme.dark.colorScheme.primary, AppPalette.darkText);
      expect(AppTheme.light.brightness, Brightness.light);
      expect(AppTheme.dark.brightness, Brightness.dark);
    });
  });
}
