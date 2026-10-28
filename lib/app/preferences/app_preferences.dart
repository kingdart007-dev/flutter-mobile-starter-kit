import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppLocalePreference {
  system,
  english,
  arabic;

  Locale? get locale => switch (this) {
        AppLocalePreference.system => null,
        AppLocalePreference.english => const Locale('en'),
        AppLocalePreference.arabic => const Locale('ar'),
      };

  static AppLocalePreference fromStorage(String? value) {
    return AppLocalePreference.values.firstWhere(
      (preference) => preference.name == value,
      orElse: () => AppLocalePreference.system,
    );
  }
}

@immutable
class AppPreferences {
  const AppPreferences({
    this.themeMode = ThemeMode.system,
    this.localePreference = AppLocalePreference.system,
    this.isSaving = false,
  });

  final ThemeMode themeMode;
  final AppLocalePreference localePreference;

  /// Transient UI status; never written to persistent storage.
  final bool isSaving;

  AppPreferences copyWith({
    ThemeMode? themeMode,
    AppLocalePreference? localePreference,
    bool? isSaving,
  }) {
    return AppPreferences(
      themeMode: themeMode ?? this.themeMode,
      localePreference: localePreference ?? this.localePreference,
      isSaving: isSaving ?? this.isSaving,
    );
  }
}

/// Small storage boundary around non-critical UI preferences.
abstract interface class AppPreferencesStore {
  Future<AppPreferences> load();
  Future<void> saveThemeMode(ThemeMode mode);
  Future<void> saveLocalePreference(AppLocalePreference preference);
}

class SharedAppPreferencesStore implements AppPreferencesStore {
  SharedAppPreferencesStore(this._preferences);

  static const String _themeKey = 'app_theme_mode';
  static const String _localeKey = 'app_locale_preference';

  final SharedPreferencesAsync _preferences;

  @override
  Future<AppPreferences> load() async {
    final String? storedTheme = await _preferences.getString(_themeKey);
    final String? storedLocale = await _preferences.getString(_localeKey);

    final ThemeMode themeMode = ThemeMode.values.firstWhere(
      (mode) => mode.name == storedTheme,
      orElse: () => ThemeMode.system,
    );

    return AppPreferences(
      themeMode: themeMode,
      localePreference: AppLocalePreference.fromStorage(storedLocale),
    );
  }

  @override
  Future<void> saveThemeMode(ThemeMode mode) =>
      _preferences.setString(_themeKey, mode.name);

  @override
  Future<void> saveLocalePreference(AppLocalePreference preference) =>
      _preferences.setString(_localeKey, preference.name);
}

final Provider<AppPreferencesStore> appPreferencesStoreProvider =
    Provider<AppPreferencesStore>((ref) {
  return SharedAppPreferencesStore(SharedPreferencesAsync());
});

/// Seeded by main() before the first frame so saved preferences don't visibly
/// flash from the system default to the persisted choice at startup.
final Provider<AppPreferences> initialAppPreferencesProvider =
    Provider<AppPreferences>((ref) => const AppPreferences());

final AsyncNotifierProvider<AppPreferencesController, AppPreferences>
    appPreferencesProvider =
    AsyncNotifierProvider<AppPreferencesController, AppPreferences>(
  AppPreferencesController.new,
);

class AppPreferencesController extends AsyncNotifier<AppPreferences> {
  @override
  AppPreferences build() {
    return ref.watch(initialAppPreferencesProvider);
  }

  Future<void> setThemeMode(ThemeMode mode) {
    return _update(
      (current) => current.copyWith(themeMode: mode),
      (store) => store.saveThemeMode(mode),
    );
  }

  Future<void> setLocalePreference(AppLocalePreference preference) {
    return _update(
      (current) => current.copyWith(localePreference: preference),
      (store) => store.saveLocalePreference(preference),
    );
  }

  Future<void> _update(
    AppPreferences Function(AppPreferences current) update,
    Future<void> Function(AppPreferencesStore store) persist,
  ) async {
    final AppPreferences? current = state.asData?.value;
    if (current == null || current.isSaving) {
      return;
    }

    // Apply immediately while serializing writes. Roll back if native storage
    // reports a failure so the UI never claims a preference was saved.
    state = AsyncData(update(current).copyWith(isSaving: true));

    try {
      await persist(ref.read(appPreferencesStoreProvider));
      final AppPreferences? latest = state.asData?.value;
      if (latest != null) {
        state = AsyncData(latest.copyWith(isSaving: false));
      }
    } catch (_) {
      state = AsyncData(current);
      rethrow;
    }
  }
}
