import 'package:flutter/material.dart';

import '../../../app/localization/app_strings.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/ui/app_page.dart';
import '../../../shared/ui/app_section_header.dart';
import '../../../shared/ui/app_card.dart';

class FoundationScreen extends StatelessWidget {
  const FoundationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStrings strings = AppStrings.of(context);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(strings.foundationTitle)),
      body: AppPage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppSectionHeader(
              eyebrow: strings.foundationEyebrow,
              title: strings.foundationHeadline,
              description: strings.foundationDescription,
            ),
            const SizedBox(height: AppSpacing.xl),
            AppCard(
              child: Column(
                children: <Widget>[
                  _PrincipleRow(
                    number: '01',
                    title: strings.easyPathTitle,
                    description: strings.easyPathDescription,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Divider(color: colors.outlineVariant),
                  const SizedBox(height: AppSpacing.lg),
                  _PrincipleRow(
                    number: '02',
                    title: strings.testableTitle,
                    description: strings.testableDescription,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Divider(color: colors.outlineVariant),
                  const SizedBox(height: AppSpacing.lg),
                  _PrincipleRow(
                    number: '03',
                    title: strings.platformTitle,
                    description: strings.platformDescription,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              strings.foundationFooter,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrincipleRow extends StatelessWidget {
  const _PrincipleRow({
    required this.number,
    required this.title,
    required this.description,
  });

  final String number;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 38,
          child: Text(
            number,
            style: theme.textTheme.labelLarge?.copyWith(
              color: colors.secondary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: theme.textTheme.titleMedium),
              const SizedBox(height: AppSpacing.xs),
              Text(
                description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
