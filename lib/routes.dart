import 'package:demoapp/bottom_tab_bar.dart';
import 'package:demoapp/page/riverpod_page.dart';
import 'package:demoapp/page/statefull_page.dart';
import 'package:demoapp/page/stateless_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _slsPageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'slsPageNav');
final GlobalKey<NavigatorState> _rpdNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rpdnav');

final GoRouter routes = GoRouter(
  initialLocation: '/slsPage',
  navigatorKey: rootNavigatorKey,
  routes: [
    StatefulShellRoute(
      builder: (context, state, navigationShell) => navigationShell,
      navigatorContainerBuilder: (context, navigationShell, children) =>
          BottomTabBar(navigationShell: navigationShell, children: children),
      branches: [
        StatefulShellBranch(
          navigatorKey: _slsPageNavigatorKey,
          routes: [
            GoRoute(
              path: '/slsPage',
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
    )
  ],
);
