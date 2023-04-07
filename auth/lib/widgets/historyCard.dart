import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    required this.day,
    required this.body,
  }) : super(key: key);

  final String day;
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
                      day,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: Color.fromRGBO(234, 225, 186, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 8, 8, 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        body,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
