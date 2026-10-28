import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_palette.dart';
import '../../../app/theme/app_radii.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/ui/app_card.dart';
import '../../../shared/ui/app_page.dart';
import '../../../shared/ui/app_section_header.dart';

class DesignSystemScreen extends StatelessWidget {
  const DesignSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Design system')),
      body: AppPage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const AppSectionHeader(
              eyebrow: 'STYLE GUIDE · 01',
              title: 'The visual language.',
              description:
                  'Luxury through restraint: a neutral palette, confident '
                  'typography, generous space, and surfaces that feel '
                  'considered rather than decorated.',
            ),
            const SizedBox(height: AppSpacing.xl),
            _ShowcaseHeading(
              title: 'Monochrome palette',
              description: 'Color is a role, not an ornament.',
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: const <Widget>[
                _ColorSample(
                  label: 'Ink',
                  hex: '#171715',
                  color: AppPalette.ink,
                  foreground: AppPalette.white,
                ),
                _ColorSample(
                  label: 'Graphite',
                  hex: '#555550',
                  color: AppPalette.graphite,
                  foreground: AppPalette.white,
                ),
                _ColorSample(
                  label: 'Mist',
                  hex: '#E8E8E3',
                  color: AppPalette.mist,
                  foreground: AppPalette.ink,
                ),
                _ColorSample(
                  label: 'Paper',
                  hex: '#FBFBF9',
                  color: AppPalette.paper,
                  foreground: AppPalette.ink,
                  outlined: true,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            _ShowcaseHeading(
              title: 'Typography',
              description: 'Hierarchy first. Decoration last.',
            ),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Display',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Make room\nfor clarity.',
                    style: theme.textTheme.displaySmall,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Divider(color: colors.outlineVariant),
                  const SizedBox(height: AppSpacing.lg),
                  Text('Section heading', style: theme.textTheme.titleLarge),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Body copy should stay readable, relaxed, and comfortable '
                    'at larger accessibility text sizes.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colors.onSurfaceVariant,
                      height: 1.55,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _ShowcaseHeading(
              title: 'Surfaces',
              description: 'Group related content; leave the rest open.',
            ),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Standard card', style: theme.textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'White surface, fine neutral outline, 20 px radius, '
                    'no heavy shadow.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: colors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(AppRadii.control),
                    ),
                    child: Text(
                      'Secondary surface',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _ShowcaseHeading(
              title: 'Controls',
              description: 'Clear labels, comfortable targets, quiet feedback.',
            ),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FilledButton(
                    onPressed: () => context.pushNamed('foundation'),
                    child: const Text('Primary action'),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  OutlinedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Secondary action'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Buttons use a minimum 48 px height. Real actions should '
                    'always have a clear label and a meaningful result.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _ShowcaseHeading(
              title: 'Spacing rhythm',
              description: 'A small scale keeps layouts consistent.',
            ),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _SpacingSample(label: '4', width: AppSpacing.xxs),
                  const SizedBox(height: AppSpacing.md),
                  _SpacingSample(label: '8', width: AppSpacing.xs),
                  const SizedBox(height: AppSpacing.md),
                  _SpacingSample(label: '12', width: AppSpacing.sm),
                  const SizedBox(height: AppSpacing.md),
                  _SpacingSample(label: '16', width: AppSpacing.md),
                  const SizedBox(height: AppSpacing.md),
                  _SpacingSample(label: '24', width: AppSpacing.lg),
                  const SizedBox(height: AppSpacing.md),
                  _SpacingSample(label: '32', width: AppSpacing.xl),
                  const SizedBox(height: AppSpacing.md),
                  _SpacingSample(label: '48', width: AppSpacing.xxl),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShowcaseHeading extends StatelessWidget {
  const _ShowcaseHeading({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: theme.textTheme.titleLarge),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}

class _ColorSample extends StatelessWidget {
  const _ColorSample({
    required this.label,
    required this.hex,
    required this.color,
    required this.foreground,
    this.outlined = false,
  });

  final String label;
  final String hex;
  final Color color;
  final Color foreground;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Semantics(
      label: '$label, $hex',
      child: ExcludeSemantics(
        child: SizedBox(
          width: 124,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 64,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(AppRadii.control),
                  border: outlined
                      ? Border.all(color: colors.outlineVariant)
                      : null,
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: foreground,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                hex,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpacingSample extends StatelessWidget {
  const _SpacingSample({required this.label, required this.width});

  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Row(
      children: <Widget>[
        SizedBox(
          width: 32,
          child: Text(label, style: Theme.of(context).textTheme.labelMedium),
        ),
        Container(
          height: 12,
          width: width,
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(AppRadii.pill),
          ),
        ),
      ],
    );
  }
}
