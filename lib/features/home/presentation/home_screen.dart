import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../shared/ui/app_card.dart';
import '../../../shared/ui/app_page.dart';
import '../../../shared/ui/app_section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile foundation'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Explore the design system',
            onPressed: () => context.pushNamed('design-system'),
            icon: const Icon(Icons.palette_outlined),
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      body: AppPage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const AppSectionHeader(
              eyebrow: 'FLUTTER · ANDROID + IOS',
              title: 'Quietly capable.',
              description:
                  'A considered starting point for mobile apps: clarity in '
                  'the interface, intention in the architecture, and quality '
                  'built into the workflow.',
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
                          'A solid foundation',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'The best abstraction is the one that makes the next '
                    'change easier — not the one that adds the most code.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colors.onSurfaceVariant,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Divider(color: colors.outlineVariant),
                  const SizedBox(height: AppSpacing.lg),
                  const _PrincipleLine(
                    icon: Icons.phone_iphone_outlined,
                    title: 'Mobile, first',
                    description:
                        'Respect platform navigation, motion, and safe areas.',
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const _PrincipleLine(
                    icon: Icons.account_tree_outlined,
                    title: 'Clear boundaries',
                    description:
                        'Riverpod for state and dependencies; go_router for routes.',
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const _PrincipleLine(
                    icon: Icons.accessibility_new_outlined,
                    title: 'Accessible by default',
                    description:
                        'Text scaling, semantics, contrast, and recovery matter.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'EXPLORE THE FOUNDATION',
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
              child: const _DestinationRow(
                icon: Icons.palette_outlined,
                title: 'Design system',
                description: 'Monochrome tokens, type, surfaces, and controls.',
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            AppCard(
              onTap: () => context.pushNamed('foundation'),
              padding: const EdgeInsets.all(AppSpacing.md),
              child: const _DestinationRow(
                icon: Icons.architecture_outlined,
                title: 'Engineering principles',
                description:
                    'Simple architecture, SOLID, and purposeful patterns.',
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
          size: 16,
          color: colors.onSurfaceVariant,
        ),
      ],
    );
  }
}
