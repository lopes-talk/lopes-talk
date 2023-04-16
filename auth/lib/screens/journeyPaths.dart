import 'package:auth/widgets/journeyList.dart';
import 'package:flutter/material.dart';

class JourneyPathScreen extends StatelessWidget {
  const JourneyPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
        appBar: AppBar(
          title: const Text(
            'Journey Paths',
            style: TextStyle(
              color: Color.fromRGBO(255, 253, 227, 1),
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: const SingleChildScrollView(
          child: JourneyList(),
        ));
  }
}
