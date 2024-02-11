import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum BottomNavBarItem {
  home,
  rpd,
}

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: BottomNavBarItem.home.name,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_max),
            label: BottomNavBarItem.rpd.name,
          ),
        ],
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Visibility(
              visible:
                  navigationShell.currentIndex == BottomNavBarItem.home.index,
              child: children[BottomNavBarItem.home.index],
            ),
            Visibility(
              visible:
                  navigationShell.currentIndex == BottomNavBarItem.rpd.index,
              child: children[BottomNavBarItem.rpd.index],
            ),
          ],
        ),
      ),
    );
  }
}
