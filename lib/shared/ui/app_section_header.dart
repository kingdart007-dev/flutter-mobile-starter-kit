import 'package:flutter/material.dart';

import '../../app/theme/app_spacing.dart';

/// Shared page-heading hierarchy for screens with an eyebrow, title, and copy.
class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader({
    required this.eyebrow,
    required this.title,
    this.description,
    super.key,
  });

  final String eyebrow;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          eyebrow,
          style: theme.textTheme.labelMedium?.copyWith(
            color: colors.onSurfaceVariant,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(title, style: theme.textTheme.displaySmall),
        if (description != null) ...<Widget>[
          const SizedBox(height: AppSpacing.md),
          Text(
            description!,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colors.onSurfaceVariant,
              height: 1.55,
            ),
          ),
        ],
      ],
    );
  }
}
