import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/localization/app_strings.dart';
import '../../../app/preferences/app_preferences.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/ui/app_card.dart';
import '../../../shared/ui/app_page.dart';
import '../../../shared/ui/app_section_header.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppStrings strings = AppStrings.of(context);
    final AsyncValue<AppPreferences> preferenceState = ref.watch(
      appPreferencesProvider,
    );

    return Scaffold(
      appBar: AppBar(title: Text(strings.settingsTitle)),
      body: preferenceState.when(
        loading: () => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(height: AppSpacing.md),
              Text(strings.loadingPreferences),
            ],
          ),
        ),
        error: (Object error, StackTrace stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(strings.preferenceSaveError),
                const SizedBox(height: AppSpacing.md),
                OutlinedButton(
                  onPressed: () => ref.invalidate(appPreferencesProvider),
                  child: Text(strings.retry),
                ),
              ],
            ),
          ),
        ),
        data: (AppPreferences preferences) => AppPage(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppSectionHeader(
                eyebrow: strings.settingsEyebrow,
                title: strings.settingsHeadline,
                description: strings.settingsDescription,
              ),
              const SizedBox(height: AppSpacing.xl),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      strings.themePreference,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      strings.themePreferenceDescription,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Wrap(
                      spacing: AppSpacing.xs,
                      runSpacing: AppSpacing.xs,
                      children: <Widget>[
                        _PreferenceChip<ThemeMode>(
                          label: strings.system,
                          icon: Icons.brightness_auto_outlined,
                          value: ThemeMode.system,
                          selected: preferences.themeMode,
                          enabled: !preferences.isSaving,
                          onSelected: (ThemeMode value) =>
                              _setTheme(context, ref, value),
                        ),
                        _PreferenceChip<ThemeMode>(
                          label: strings.light,
                          icon: Icons.light_mode_outlined,
                          value: ThemeMode.light,
                          selected: preferences.themeMode,
                          enabled: !preferences.isSaving,
                          onSelected: (ThemeMode value) =>
                              _setTheme(context, ref, value),
                        ),
                        _PreferenceChip<ThemeMode>(
                          label: strings.dark,
                          icon: Icons.dark_mode_outlined,
                          value: ThemeMode.dark,
                          selected: preferences.themeMode,
                          enabled: !preferences.isSaving,
                          onSelected: (ThemeMode value) =>
                              _setTheme(context, ref, value),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      strings.language,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      strings.languageDescription,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Wrap(
                      spacing: AppSpacing.xs,
                      runSpacing: AppSpacing.xs,
                      children: <Widget>[
                        _PreferenceChip<AppLocalePreference>(
                          label: strings.system,
                          icon: Icons.settings_suggest_outlined,
                          value: AppLocalePreference.system,
                          selected: preferences.localePreference,
                          enabled: !preferences.isSaving,
                          onSelected: (AppLocalePreference value) =>
                              _setLocale(context, ref, value),
                        ),
                        _PreferenceChip<AppLocalePreference>(
                          label: strings.english,
                          icon: Icons.language_outlined,
                          value: AppLocalePreference.english,
                          selected: preferences.localePreference,
                          enabled: !preferences.isSaving,
                          onSelected: (AppLocalePreference value) =>
                              _setLocale(context, ref, value),
                        ),
                        _PreferenceChip<AppLocalePreference>(
                          label: strings.arabic,
                          icon: Icons.language_outlined,
                          value: AppLocalePreference.arabic,
                          selected: preferences.localePreference,
                          enabled: !preferences.isSaving,
                          onSelected: (AppLocalePreference value) =>
                              _setLocale(context, ref, value),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (preferences.isSaving) ...<Widget>[
                const SizedBox(height: AppSpacing.md),
                const LinearProgressIndicator(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _setTheme(
    BuildContext context,
    WidgetRef ref,
    ThemeMode mode,
  ) async {
    try {
      await ref.read(appPreferencesProvider.notifier).setThemeMode(mode);
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppStrings.of(context).preferenceSaveError)),
      );
    }
  }

  Future<void> _setLocale(
    BuildContext context,
    WidgetRef ref,
    AppLocalePreference preference,
  ) async {
    try {
      await ref
          .read(appPreferencesProvider.notifier)
          .setLocalePreference(preference);
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppStrings.of(context).preferenceSaveError)),
      );
    }
  }
}

class _PreferenceChip<T> extends StatelessWidget {
  const _PreferenceChip({
    required this.label,
    required this.icon,
    required this.value,
    required this.selected,
    required this.enabled,
    required this.onSelected,
  });

  final String label;
  final IconData icon;
  final T value;
  final T selected;
  final bool enabled;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: value == selected,
      child: ChoiceChip(
        label: Text(label),
        avatar: Icon(icon, size: 18),
        selected: value == selected,
        onSelected: enabled
            ? (bool isSelected) {
                if (isSelected) onSelected(value);
              }
            : null,
      ),
    );
  }
}
