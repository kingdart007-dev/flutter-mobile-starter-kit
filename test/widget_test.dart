import 'package:flutter_mobile_starter_kit/app/starter_kit_app.dart';
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

      expect(find.text('A thoughtful\nstarting point.'), findsOneWidget);
      expect(find.text('Android + iOS'), findsOneWidget);
      expect(find.text('Explore the foundation'), findsOneWidget);
    });

    testWidgets('navigates to the foundation principles', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const ProviderScope(child: StarterKitApp()),
      );
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Explore the foundation'));
      await tester.tap(find.text('Explore the foundation'));
      await tester.pumpAndSettle();

      expect(
        find.text('Principles, not layers for their own sake.'),
        findsOneWidget,
      );
      expect(find.text('Make the easy path the good path'), findsOneWidget);
    });
  });
}
