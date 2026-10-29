import 'package:flutter/material.dart';

/// The visual intent of an [AppButton].
enum AppButtonVariant { primary, secondary, tertiary }

/// A shared action control with consistent sizing and progress feedback.
///
/// Prefer outcome-focused labels such as "Save changes" over generic labels
/// such as "OK". A loading button disables repeated submissions and keeps its
/// label available to assistive technologies.
class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.loadingLabel,
    this.expand = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool isLoading;
  final String? loadingLabel;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final Widget content = _ButtonContent(
      label: label,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      loadingLabel: loadingLabel,
    );

    final VoidCallback? effectiveOnPressed =
        isLoading ? null : onPressed;

    final Widget button = switch (variant) {
      AppButtonVariant.primary => FilledButton(
        onPressed: effectiveOnPressed,
        child: content,
      ),
      AppButtonVariant.secondary => OutlinedButton(
        onPressed: effectiveOnPressed,
        child: content,
      ),
      AppButtonVariant.tertiary => TextButton(
        onPressed: effectiveOnPressed,
        child: content,
      ),
    };

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48),
      child: expand ? SizedBox(width: double.infinity, child: button) : button,
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.label,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.isLoading,
    required this.loadingLabel,
  });

  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool isLoading;
  final String? loadingLabel;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];

    if (isLoading) {
      children.add(
        const SizedBox.square(
          dimension: 18,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
      children.add(const SizedBox(width: 8));
    } else if (leadingIcon != null) {
      children.add(Icon(leadingIcon, size: 18));
      children.add(const SizedBox(width: 8));
    }

    children.add(
      Flexible(
        child: Text(
          isLoading ? (loadingLabel ?? label) : label,
          textAlign: TextAlign.center,
        ),
      ),
    );

    if (!isLoading && trailingIcon != null) {
      children.add(const SizedBox(width: 8));
      children.add(Icon(trailingIcon, size: 18));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
