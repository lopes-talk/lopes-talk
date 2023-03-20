import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
        appBar: AppBar(
          title: const Text(
            'Home',
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
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    '"Verse of the Day..."',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Zeyada',
                      color: Color.fromRGBO(138, 104, 34, 1),
                    ),
                  ),
                ),
              ),
              const Image(
                width: 450,
                height: 350,
                image: AssetImage('android/assests/THEFavorite.jpeg'),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Text(
                  'Journey Path',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Zeyada',
                    color: Color.fromRGBO(138, 104, 34, 1),
                  ),
                ),
              ),
              const TaskCard(title: 'Task to Complete', body: ""),
            ],
          ),
        ));
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Card(
            color: const Color.fromRGBO(127, 102, 74, 1),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: Color.fromRGBO(234, 225, 186, 1),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(171, 178, 109, 1),
                          minimumSize: const Size(250, 29)),
                      child: const Text(
                        'Complete',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
