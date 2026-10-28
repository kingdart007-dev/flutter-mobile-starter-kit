import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/design_system/presentation/design_system_screen.dart';
import '../../features/foundation/presentation/foundation_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../localization/app_strings.dart';

final Provider<GoRouter> appRouterProvider = Provider<GoRouter>((ref) {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'foundation',
            name: 'foundation',
            builder: (BuildContext context, GoRouterState state) {
              return const FoundationScreen();
            },
          ),
          GoRoute(
            path: 'design-system',
            name: 'design-system',
            builder: (BuildContext context, GoRouterState state) {
              return const DesignSystemScreen();
            },
          ),
          GoRoute(
            path: 'settings',
            name: 'settings',
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsScreen();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) {
      final AppStrings strings = AppStrings.of(context);
      return Scaffold(
        appBar: AppBar(title: Text(strings.pageUnavailable)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(strings.pageUnavailableMessage),
          ),
        ),
      );
    },
  );

  ref.onDispose(router.dispose);
  return router;
});
