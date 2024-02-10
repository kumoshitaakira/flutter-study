import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum BottomNavBarItem {
  home,
  prd,
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
            icon: const Icon(Icons.home),
            label: BottomNavBarItem.home.name,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: BottomNavBarItem.prd.name,
          ),
        ],
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Visibility(
              visible:
                  navigationShell.currentIndex == BottomNavBarItem.home.index,
              child: children[BottomNavBarItem.home.index],
            ),
            Visibility(
              visible:
                  navigationShell.currentIndex == BottomNavBarItem.prd.index,
              child: children[BottomNavBarItem.prd.index],
            ),
          ],
        ),
      ),
    );
  }
}
