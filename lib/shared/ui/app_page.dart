import 'package:flutter/material.dart';

import '../../app/theme/app_spacing.dart';

/// Gives feature screens a consistent, scroll-safe page inset and reading width.
///
/// Keep app bars, bottom navigation, and route-specific composition outside this
/// widget so screens can remain explicit about their platform/navigation needs.
class AppPage extends StatelessWidget {
  const AppPage({
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(
      AppSpacing.lg,
      AppSpacing.xl,
      AppSpacing.lg,
      AppSpacing.xl,
    ),
    this.maxWidth = 640,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: padding,
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: SizedBox(
              width: double.infinity,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
