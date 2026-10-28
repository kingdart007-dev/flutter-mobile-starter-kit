import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter_kit/app/theme/app_motion.dart';
import 'package:flutter_mobile_starter_kit/app/theme/app_theme.dart';
import 'package:flutter_mobile_starter_kit/shared/ui/app_page.dart';
import 'package:flutter_mobile_starter_kit/shared/ui/app_section_header.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppMotion', () {
    testWidgets('preserves standard duration when motion is allowed', (
      WidgetTester tester,
    ) async {
      late Duration resolvedDuration;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(disableAnimations: false),
          child: Builder(
            builder: (BuildContext context) {
              resolvedDuration = AppMotion.durationFor(
                context,
                AppMotion.standard,
              );
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      expect(resolvedDuration, AppMotion.standard);
    });

    testWidgets('removes optional duration when reduced motion is requested', (
      WidgetTester tester,
    ) async {
      late Duration resolvedDuration;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(disableAnimations: true),
          child: Builder(
            builder: (BuildContext context) {
              resolvedDuration = AppMotion.durationFor(
                context,
                AppMotion.standard,
              );
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      expect(resolvedDuration, Duration.zero);
    });
  });

  testWidgets('common buttons and icon buttons have 48 px minimum height', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FilledButton(
                  onPressed: () {},
                  child: const Text('Continue'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
                IconButton(
                  tooltip: 'More options',
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    expect(
      tester.getSize(find.byType(FilledButton)).height,
      greaterThanOrEqualTo(48),
    );
    expect(
      tester.getSize(find.byType(OutlinedButton)).height,
      greaterThanOrEqualTo(48),
    );
    expect(
      tester.getSize(find.byTooltip('More options')).height,
      greaterThanOrEqualTo(48),
    );
  });

  testWidgets('shared page heading wraps at larger text scales', (
    WidgetTester tester,
  ) async {
    const String longTitle =
        'A thoughtfully designed foundation that adapts to every reader';

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: MediaQuery(
            data: const MediaQueryData(textScaler: TextScaler.linear(2)),
            child: AppPage(
              child: AppSectionHeader(
                eyebrow: 'DESIGN PRINCIPLES',
                title: longTitle,
                description:
                    'A longer explanation helps confirm that page content '
                    'remains readable when text is enlarged.',
              ),
            ),
          ),
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text(longTitle), findsOneWidget);
    expect(tester.getSize(find.text(longTitle)).height, greaterThan(48));
  });
}
