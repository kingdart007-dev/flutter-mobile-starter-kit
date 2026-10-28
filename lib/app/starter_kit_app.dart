import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'localization/app_strings.dart';
import 'preferences/app_preferences.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class StarterKitApp extends ConsumerWidget {
  const StarterKitApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppPreferences preferences = ref.watch(appPreferencesProvider);

    return MaterialApp.router(
      onGenerateTitle: (BuildContext context) => AppStrings.of(context).appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: preferences.themeMode,
      locale: preferences.localePreference.locale,
      supportedLocales: AppStrings.supportedLocales,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        AppStrings.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      routerConfig: ref.watch(appRouterProvider),
    );
  }
}
