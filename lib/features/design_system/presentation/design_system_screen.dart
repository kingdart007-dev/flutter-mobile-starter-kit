import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/localization/app_strings.dart';
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
    final AppStrings strings = AppStrings.of(context);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(strings.designSystemTitle)),
      body: AppPage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppSectionHeader(
              eyebrow: strings.designEyebrow,
              title: strings.designHeadline,
              description: strings.designDescription,
            ),
            const SizedBox(height: AppSpacing.xl),
            _ShowcaseHeading(
              title: strings.monochromePalette,
              description: strings.colorIsRole,
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: <Widget>[
                _ColorSample(
                  label: strings.ink,
                  hex: '#171715',
                  color: AppPalette.ink,
                  foreground: AppPalette.white,
                ),
                _ColorSample(
                  label: strings.graphite,
                  hex: '#555550',
                  color: AppPalette.graphite,
                  foreground: AppPalette.white,
                ),
                _ColorSample(
                  label: strings.mist,
                  hex: '#E8E8E3',
                  color: AppPalette.mist,
                  foreground: AppPalette.ink,
                ),
                _ColorSample(
                  label: strings.paper,
                  hex: '#FBFBF9',
                  color: AppPalette.paper,
                  foreground: AppPalette.ink,
                  outlined: true,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            _ShowcaseHeading(
              title: strings.typography,
              description: strings.hierarchyFirst,
            ),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    strings.displayLabel,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    strings.displaySample,
                    style: theme.textTheme.displaySmall,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Divider(color: colors.outlineVariant),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    strings.sectionHeading,
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    strings.typographyBody,
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
              title: strings.surfaces,
              description: strings.surfaceDescription,
            ),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(strings.standardCard, style: theme.textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    strings.cardDescription,
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
                      strings.secondarySurface,
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
              title: strings.controls,
              description: strings.controlsDescription,
            ),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FilledButton(
                    onPressed: () => context.pushNamed('foundation'),
                    child: Text(strings.primaryAction),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  OutlinedButton(
                    onPressed: () => context.pop(),
                    child: Text(strings.secondaryAction),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    strings.buttonGuidance,
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
              title: strings.spacingRhythm,
              description: strings.spacingDescription,
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
  const _ShowcaseHeading({
    required this.title,
    required this.description,
  });

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
                alignment: AlignmentDirectional.bottomStart,
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
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
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
