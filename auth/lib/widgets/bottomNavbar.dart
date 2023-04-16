import 'package:auth/screens/about.dart';
import 'package:auth/screens/history.dart';
import 'package:auth/screens/home.dart';
import 'package:auth/screens/journeyPaths.dart';
import 'package:auth/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/navProvider.dart';

class BottomNavigation extends ConsumerWidget {
  final List<BottomNavigationBarItem> bottomNavigationItems = [
    const BottomNavigationBarItem(
      label: 'Journey Paths',
      icon: Icon(Icons.book_rounded),
      activeIcon: Icon(Icons.book_outlined),
    ),
    const BottomNavigationBarItem(
      label: 'History',
      icon: Icon(Icons.manage_history_rounded),
      activeIcon: Icon(Icons.history),
    ),
    const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(Icons.home_rounded),
      activeIcon: Icon(Icons.home_outlined),
    ),
    const BottomNavigationBarItem(
      label: 'About',
      icon: Icon(Icons.info_rounded),
      activeIcon: Icon(Icons.info_outline),
    ),
    const BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(Icons.settings_rounded),
      activeIcon: Icon(Icons.settings_outlined),
    ),
  ];

  final List<Widget> screens = [
    const JourneyPathScreen(),
    const HistoryScreen(),
    const HomeScreen(),
    const AboutScreen(),
    const SettingsScreen(),
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
