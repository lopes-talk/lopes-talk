import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/screens/about_screen.dart';
import 'package:lopes_talk/screens/history_screen.dart';
import 'package:lopes_talk/screens/home_screen.dart';
import 'package:lopes_talk/screens/journey_paths_screen.dart';
import 'package:lopes_talk/screens/settings_screen.dart';

import '../providers/nav_provider.dart';

class BottomNavigation extends ConsumerWidget {
  final List<BottomNavigationBarItem> bottomNavigationItems = [
    const BottomNavigationBarItem(
      label: 'Journey Paths',
      icon: Icon(Icons.book_outlined),
      activeIcon: Icon(Icons.book_rounded),
    ),
    const BottomNavigationBarItem(
      label: 'History',
      icon: Icon(Icons.history),
      activeIcon: Icon(Icons.manage_history_rounded),
    ),
    const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home_rounded),
    ),
    const BottomNavigationBarItem(
      label: 'About',
      icon: Icon(Icons.info_outline),
      activeIcon: Icon(Icons.info_rounded),
    ),
    const BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(Icons.settings_outlined),
      activeIcon: Icon(Icons.settings_rounded),
    ),
  ];

  final List<Widget> screens = [
    const JourneyPathScreen(),
    const HistoryScreen(),
    const HomeScreen(),
    const AboutScreen(),
    SettingsScreen(),
  ];

  BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTabIndex = ref.watch(selectedTabIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: selectedTabIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTabIndex,
        items: bottomNavigationItems,
        onTap: (int index) {
          ref.read(selectedTabIndexProvider.notifier).state = index;
        },
        selectedItemColor: const Color.fromRGBO(255, 253, 227, 1),
        unselectedItemColor: const Color.fromRGBO(233, 231, 206, 1),
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}
