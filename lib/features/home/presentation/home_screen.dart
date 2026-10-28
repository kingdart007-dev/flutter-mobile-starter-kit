import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/localization/app_strings.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/ui/app_card.dart';
import '../../../shared/ui/app_page.dart';
import '../../../shared/ui/app_section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStrings strings = AppStrings.of(context);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.homeTitle),
        actions: <Widget>[
          IconButton(
            tooltip: strings.designSystemTooltip,
            onPressed: () => context.pushNamed('design-system'),
            icon: const Icon(Icons.palette_outlined),
          ),
          IconButton(
            tooltip: strings.settingsTooltip,
            onPressed: () => context.pushNamed('settings'),
            icon: const Icon(Icons.tune_rounded),
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      body: AppPage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppSectionHeader(
              eyebrow: strings.homeEyebrow,
              title: strings.homeHeadline,
              description: strings.homeDescription,
            ),
            const SizedBox(height: AppSpacing.xl),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: colors.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          Icons.layers_outlined,
                          color: colors.onSurface,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Text(
                          strings.solidFoundation,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    strings.solidFoundationDescription,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colors.onSurfaceVariant,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Divider(color: colors.outlineVariant),
                  const SizedBox(height: AppSpacing.lg),
                  _PrincipleLine(
                    icon: Icons.phone_iphone_outlined,
                    title: strings.mobileFirst,
                    description: strings.mobileFirstDescription,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _PrincipleLine(
                    icon: Icons.account_tree_outlined,
                    title: strings.clearBoundaries,
                    description: strings.clearBoundariesDescription,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _PrincipleLine(
                    icon: Icons.accessibility_new_outlined,
                    title: strings.accessibleByDefault,
                    description: strings.accessibleByDefaultDescription,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              strings.exploreFoundation,
              style: theme.textTheme.labelMedium?.copyWith(
                color: colors.onSurfaceVariant,
                letterSpacing: 1.4,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              onTap: () => context.pushNamed('design-system'),
              padding: const EdgeInsets.all(AppSpacing.md),
              child: _DestinationRow(
                icon: Icons.palette_outlined,
                title: strings.designSystemTitle,
                description: strings.designSystemDescription,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            AppCard(
              onTap: () => context.pushNamed('foundation'),
              padding: const EdgeInsets.all(AppSpacing.md),
              child: _DestinationRow(
                icon: Icons.architecture_outlined,
                title: strings.foundationTitle,
                description: strings.engineeringDescription,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrincipleLine extends StatelessWidget {
  const _PrincipleLine({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(icon, color: colors.onSurfaceVariant, size: 22),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: theme.textTheme.titleMedium),
              const SizedBox(height: AppSpacing.xxs),
              Text(
                description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DestinationRow extends StatelessWidget {
  const _DestinationRow({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Row(
      children: <Widget>[
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: colors.onSurface, size: 22),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: theme.textTheme.titleMedium),
              const SizedBox(height: AppSpacing.xxs),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Icon(
          Icons.arrow_forward_ios_rounded,
          matchTextDirection: true,
          size: 16,
          color: colors.onSurfaceVariant,
        ),
      ],
    );
  }
}
