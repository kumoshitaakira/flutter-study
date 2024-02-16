import 'package:demoapp/bottom_tab_bar.dart';
import 'package:demoapp/page/home_page.dart';
import 'package:demoapp/page/riverpod_page.dart';
import 'package:demoapp/page/start_page.dart';
import 'package:demoapp/page/statefull_page.dart';
import 'package:demoapp/page/stateless_page.dart';
import 'package:demoapp/provider/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'homeNav');
final GlobalKey<NavigatorState> _slsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'slsNav');
final GlobalKey<NavigatorState> _rpdNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rpdnav');

final Provider<GoRouter> router = Provider(
  (ref) => GoRouter(
    initialLocation: '/home',
    navigatorKey: rootNavigatorKey,
    routes: [
      StatefulShellRoute(
        builder: (context, state, navigationShell) => navigationShell,
        navigatorContainerBuilder: (context, navigationShell, children) =>
            BottomTabBar(navigationShell: navigationShell, children: children),
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                name: 'Home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _slsNavigatorKey,
            routes: [
              GoRoute(
                path: '/sls',
                name: 'Stateless',
                builder: (context, state) => const StatelessPage(),
                routes: [
                  GoRoute(
                    path: 'sfl',
                    name: 'Stateful',
                    builder: (context, state) => const StatefullPage(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rpdNavigatorKey,
            routes: [
              GoRoute(
                path: '/rpd',
                name: 'Riverpod',
                builder: (context, state) => const RiverpodPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/start',
        name: 'Start',
        builder: (context, state) => const StartPage(),
      ),
    ],
    redirect: (context, state) {
      if (ref.watch(firebaseAuthProvider).currentUser == null) {
        return state.matchedLocation == '/start' ? null : '/start';
      }
      return null;
    },
  ),
);
