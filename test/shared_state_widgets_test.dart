import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter_kit/app/theme/app_theme.dart';
import 'package:flutter_mobile_starter_kit/shared/ui/app_status_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'empty state explains the situation without inventing an action',
    (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const Scaffold(
          body: AppEmptyState(
            title: 'Nothing saved yet',
            message: 'Saved items will appear here.',
          ),
        ),
      ),
    );

    expect(find.text('Nothing saved yet'), findsOneWidget);
    expect(find.text('Saved items will appear here.'), findsOneWidget);
    expect(find.byIcon(Icons.inbox_outlined), findsOneWidget);
    expect(find.byType(FilledButton), findsNothing);
    expect(tester.takeException(), isNull);
  );

  testWidgets('empty state runs its supplied primary action', (
    WidgetTester tester,
  ) async {
    bool actionCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: AppEmptyState(
            title: 'No projects yet',
            message: 'Create a project to get started.',
            actionLabel: 'Create project',
            onAction: () => actionCalled = true,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Create project'));
    await tester.pump();

    expect(actionCalled, isTrue);
  });

  testWidgets('error state announces a safe message and retries in RTL', (
    WidgetTester tester,
  ) async {
    bool retryCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        home: MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(1.6)),
          child: const Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: AppErrorState(
                title: 'تعذر تحميل المحتوى',
                message: 'تحقق من الاتصال ثم حاول مرة أخرى.',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('تعذر تحميل المحتوى'), findsOneWidget);
    expect(find.text('تحقق من الاتصال ثم حاول مرة أخرى.'), findsOneWidget);
    expect(find.byIcon(Icons.error_outline), findsOneWidget);
    expect(tester.takeException(), isNull);

    // Rebuild with a real retry callback; the UI remains caller-controlled.
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: AppErrorState(
              title: 'تعذر تحميل المحتوى',
              message: 'تحقق من الاتصال ثم حاول مرة أخرى.',
              retryLabel: 'إعادة المحاولة',
              onRetry: () => retryCalled = true,
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('إعادة المحاولة'));
    await tester.pump();

    expect(retryCalled, isTrue);
  });
}
