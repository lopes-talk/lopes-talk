import 'package:auth/about.dart';
import 'package:auth/history.dart';
import 'package:auth/home.dart';
import 'package:auth/journeyPath.dart';
import 'package:auth/settings.dart';
import 'package:flutter/material.dart';

class Redirect extends StatefulWidget {
  const Redirect({super.key});

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {
  //final _formKey = GlobalKey<FormState>();
  int pageIndex = 2;

  final pages = [
    const JourneyPath(),
    const History(),
    const Home(),
    const About(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: Column(
                children: [
                  pageIndex == 0
                      ? const Icon(
                          Icons.book_rounded,
                          color: Color.fromRGBO(255, 253, 227, 1),
                          size: 35,
                        )
                      : const Icon(
                          Icons.book_outlined,
                          color: Color.fromRGBO(255, 253, 227, 1),
                          size: 35,
                        ),
                  const Text(
                    'Journey',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 253, 227, 1),
                      //fontFamily: ,
                    ),
                  ),
                ],
              ),
              label: const Text('')),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: Column(
                children: [
                  pageIndex == 1
                      ? const Icon(
                          Icons.manage_history_rounded,
                          color: Color.fromRGBO(255, 253, 227, 1),
                          size: 35,
                        )
                      : const Icon(
                          Icons.history,
                          color: Color.fromRGBO(255, 253, 227, 1),
                          size: 35,
                        ),
                  const Text(
                    'History',
                    style: TextStyle(color: Color.fromRGBO(255, 253, 227, 1)),
                  ),
                ],
              ),
              label: const Text('')),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: Column(
                children: [
                  pageIndex == 2
                      ? const Icon(
                          Icons.home_rounded,
                          color: Color.fromRGBO(255, 253, 227, 1),
                          size: 35,
                        )
                      : const Icon(
                          Icons.home_outlined,
                          color: Color.fromRGBO(255, 253, 227, 1),
                          size: 35,
                        ),
                  const Text(
                    'Home',
                    style: TextStyle(color: Color.fromRGBO(255, 253, 227, 1)),
                  ),
                ],
              ),
              label: const Text('')),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: Column(
                children: [
                  pageIndex == 3
                      ? const Icon(
                          Icons.info_rounded,
                          color: Color.fromRGBO(255, 253, 227, 1),
                          size: 35,
                        )
                      : const Icon(
                          Icons.info_outline,
                          color: Color.fromRGBO(255, 253, 227, 1),
                          size: 35,
                        ),
                  const Text(
                    'About',
                    style: TextStyle(color: Color.fromRGBO(255, 253, 227, 1)),
                  ),
                ],
              ),
              label: const Text('')),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  pageIndex = 4;
                });
              },
              icon: Column(
                children: [
                  pageIndex == 4
                      ? const Icon(
                          Icons.settings_rounded,
                          color: Color.fromRGBO(255, 253, 227, 1),
                          size: 35,
                        )
                      : const Icon(
                          Icons.settings_outlined,
                          color: Color.fromRGBO(255, 253, 227, 1),
                          size: 35,
                        ),
                  const Text(
                    'Settings',
                    style: TextStyle(color: Color.fromRGBO(255, 253, 227, 1)),
                  ),
                ],
              ),
              label: const Text('')),
        ],
      ),
    );
  }
}
