import 'package:auth/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/about.dart';
import 'screens/addTask.dart';
import 'screens/editTask.dart';
import 'screens/history.dart';
import 'screens/journeyPaths.dart';
import 'screens/journeyTasks.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/settings.dart';
import 'widgets/bottomNavbar.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(138, 104, 34, 1),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const AuthWrapper(),
      routes: {
        //'/': (context) => BottomNavigation(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/about': (context) => const AboutScreen(),
        '/history': (context) => const HistoryScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/addTask': (context) => const AddTaskScreen(),
        '/editTask': (context) => const EditTaskScreen(),
        '/journeyPaths': (context) => const JourneyPathScreen(),
        '/journeyTasks': (context) => const JourneyTasksScreen(),
      },
    );
  }
}

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    if (user != null) {
      return BottomNavigation();
    } else {
      return const LoginScreen();
    }
  }
}
