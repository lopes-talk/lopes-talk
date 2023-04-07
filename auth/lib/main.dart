import 'package:auth/screens/about.dart';
import 'package:auth/screens/addTask.dart';
import 'package:auth/screens/editTask.dart';
import 'package:auth/screens/history.dart';
import 'package:auth/screens/journeyPath.dart';
import 'package:auth/screens/login.dart';
import 'package:auth/screens/register.dart';
import 'package:auth/screens/seeMoreEmotional.dart';
import 'package:auth/screens/seeMoreMental.dart';
import 'package:auth/screens/seeMorePhysical.dart';
import 'package:auth/screens/seeMorePractical.dart';
import 'package:auth/screens/seeMoreSocial.dart';
import 'package:auth/screens/settings.dart';
import 'package:auth/widgets/bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

        //  default font family
        //fontFamily: 'sweet purple'
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => BottomNavigation(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/about': (context) => const AboutScreen(),
        '/history': (context) => const HistoryScreen(),
        '/settings': (context) => const Settings(),
        '/addTask': (context) => const AddTaskScreen(),
        '/editTask': (context) => const EditTaskScreen(),
        '/journeyPaths': (context) => const JourneyPathScreen(),
        '/journeyEmotional': (context) => const SeeMoreEmotionalScreen(),
        '/journeyMental': (context) => const SeeMoreMentalScreen(),
        '/journeyPhysical': (context) => const SeeMorePhysicalScreen(),
        '/journeyPractical': (context) => const SeeMorePracticalScreen(),
        '/journeySocial': (context) => const SeeMoreSocialScreen(),
      },
    );
  }
}
