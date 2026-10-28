import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;
    final TextTheme text = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Mobile Starter Kit'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'MOBILE APP FOUNDATION',
                    style: text.labelLarge?.copyWith(
                      color: colors.secondary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'A thoughtful\nstarting point.',
                    style: text.displaySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.08,
                      letterSpacing: -1.1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'A small, well-structured base for building excellent '
                    'mobile apps — without unnecessary layers or dependencies.',
                    style: text.bodyLarge?.copyWith(
                      color: colors.onSurfaceVariant,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colors.surfaceContainerLow,
                      border: Border.all(color: colors.outlineVariant),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'A solid foundation',
                          style: text.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const _FoundationRow(
                          icon: Icons.phone_android_outlined,
                          title: 'Android + iOS',
                          description: 'Focused on native mobile targets.',
                        ),
                        const SizedBox(height: 20),
                        const _FoundationRow(
                          icon: Icons.account_tree_outlined,
                          title: 'Clear boundaries',
                          description:
                              'Riverpod for dependencies, go_router for navigation.',
                        ),
                        const SizedBox(height: 20),
                        const _FoundationRow(
                          icon: Icons.rule_folder_outlined,
                          title: 'Simple by default',
                          description:
                              'No code generation or layers without a reason.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => context.pushNamed('foundation'),
                      child: const Text('Explore the foundation'),
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

class _FoundationRow extends StatelessWidget {
  const _FoundationRow({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final TextTheme text = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: colors.onSurfaceVariant,
            size: 22,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: text.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: text.bodyMedium?.copyWith(
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
