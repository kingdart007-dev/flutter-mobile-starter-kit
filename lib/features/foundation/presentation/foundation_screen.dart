import 'package:flutter/material.dart';

class FoundationScreen extends StatelessWidget {
  const FoundationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;
    final TextTheme text = theme.textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('The foundation')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'HOW WE BUILD',
                    style: text.labelLarge?.copyWith(
                      color: colors.secondary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.4,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Principles, not layers for their own sake.',
                    style: text.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.15,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Start with the smallest structure that solves the real '
                    'problem. Add complexity only when it improves clarity, '
                    'testability, or user experience.',
                    style: text.bodyLarge?.copyWith(
                      color: colors.onSurfaceVariant,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 28),
                  const _PrincipleRow(
                    number: '01',
                    title: 'Make the easy path the good path',
                    description:
                        'Sensible defaults, clear naming, and few decisions '
                        'before a developer can build a screen.',
                  ),
                  const SizedBox(height: 22),
                  const _PrincipleRow(
                    number: '02',
                    title: 'Keep behavior testable',
                    description:
                        'Separate decisions from rendering and keep '
                        'dependencies explicit and replaceable in tests.',
                  ),
                  const SizedBox(height: 22),
                  const _PrincipleRow(
                    number: '03',
                    title: 'Respect the platform',
                    description:
                        'Navigation, accessibility, text scaling, and system '
                        'settings are product behavior—not polish to add later.',
                  ),
                  const SizedBox(height: 28),
                  Divider(color: colors.outlineVariant),
                  const SizedBox(height: 16),
                  Text(
                    'This starter is intentionally evolving in small, '
                    'verifiable phases. Planned capabilities are documented '
                    'separately from implemented and tested behavior.',
                    style: text.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
    final ColorScheme colors = Theme.of(context).colorScheme;
    final TextTheme text = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 38,
          child: Text(
            number,
            style: text.labelLarge?.copyWith(
              color: colors.secondary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: text.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: text.bodyMedium?.copyWith(
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
