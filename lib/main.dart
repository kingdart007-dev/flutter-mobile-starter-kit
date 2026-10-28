import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/preferences/app_preferences.dart';
import 'app/starter_kit_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedAppPreferencesStore preferencesStore =
      SharedAppPreferencesStore(SharedPreferencesAsync());

  AppPreferences initialPreferences;
  try {
    initialPreferences = await preferencesStore.load();
  } catch (_) {
    // Preferences are non-critical. If platform storage is temporarily
    // unavailable, let the app start with safe system defaults.
    initialPreferences = const AppPreferences();
  }

  runApp(
    ProviderScope(
      overrides: [
        appPreferencesStoreProvider.overrideWithValue(preferencesStore),
        initialAppPreferencesProvider.overrideWithValue(initialPreferences),
      ],
      child: const StarterKitApp(),
    ),
  );
}
