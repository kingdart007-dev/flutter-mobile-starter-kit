import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/design_system/presentation/design_system_screen.dart';
import '../../features/foundation/presentation/foundation_screen.dart';
import '../../features/home/presentation/home_screen.dart';

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
        ],
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Page unavailable')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text('We could not find that page.'),
          ),
        ),
      );
    },
  );

  ref.onDispose(router.dispose);
  return router;
});
