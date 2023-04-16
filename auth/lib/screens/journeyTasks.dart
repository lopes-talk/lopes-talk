import 'package:auth/widgets/journeyTaskCard.dart';
import 'package:flutter/material.dart';

class JourneyTasksScreen extends StatelessWidget {
  const JourneyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
        appBar: AppBar(
          title: const Text(
            '"Journey Name"',
            style: TextStyle(
              color: Color.fromRGBO(255, 253, 227, 1),
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addTask');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(171, 178, 109, 1),
                        minimumSize: const Size(100, 29)),
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    )),
              ),
              const JourneyTasksCard(title: 'Task to complete', body: ""),
            ],
          ),
        ));
  }
}
