import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter_kit/shared/ui/app_button.dart';
import 'package:flutter_mobile_starter_kit/shared/ui/app_empty_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppButton', () {
    testWidgets('calls its action when tapped', (WidgetTester tester) async {
      int calls = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(label: 'Continue', onPressed: () => calls++),
          ),
        ),
      );

      await tester.tap(find.text('Continue'));
      expect(calls, 1);
    });

    testWidgets('prevents repeated action while loading', (
      WidgetTester tester,
    ) async {
      int calls = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Save',
              loadingLabel: 'Saving',
              isLoading: true,
              onPressed: () => calls++,
            ),
          ),
        ),
      );

      expect(find.text('Saving'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.tap(find.text('Saving'));
      expect(calls, 0);
    });

    testWidgets('supports a full-width layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Create',
              onPressed: () {},
              expand: true,
            ),
          ),
        ),
      );

      final Size size = tester.getSize(find.byType(FilledButton));
      expect(size.width, 800);
      expect(size.height, greaterThanOrEqualTo(48));
    });
  });

  group('AppEmptyState', () {
    testWidgets('shows explanatory copy and optional action', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppEmptyState(
              title: 'Nothing here yet',
              description: 'Create an item to get started.',
              action: FilledButton(
                onPressed: () {},
                child: const Text('Create item'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Nothing here yet'), findsOneWidget);
      expect(find.text('Create an item to get started.'), findsOneWidget);
      expect(find.text('Create item'), findsOneWidget);
    });

    testWidgets('works without optional description or action', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AppEmptyState(title: 'No results')),
        ),
      );

      expect(find.text('No results'), findsOneWidget);
    });
  });
}
