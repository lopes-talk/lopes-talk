import 'package:flutter/material.dart';

class HomeTaskCard extends StatelessWidget {
  const HomeTaskCard({
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
