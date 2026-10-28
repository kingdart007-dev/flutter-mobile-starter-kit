import 'package:flutter/widgets.dart';

/// Motion defaults for transitions that add real user feedback.
///
/// Use motion to explain a state change, not decorate static content. Always
/// resolve durations through [durationFor] when the transition is optional.
abstract final class AppMotion {
  static const Duration quick = Duration(milliseconds: 120);
  static const Duration standard = Duration(milliseconds: 200);
  static const Duration emphasis = Duration(milliseconds: 280);

  static const Curve standardCurve = Curves.easeOutCubic;
  static const Curve enterCurve = Curves.easeOutQuart;

  /// Returns zero duration when the platform asks the app to reduce animation.
  static Duration durationFor(BuildContext context, Duration duration) {
    final bool disableAnimations =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    return disableAnimations ? Duration.zero : duration;
  }
}
