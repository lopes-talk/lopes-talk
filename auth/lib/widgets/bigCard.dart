import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
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
                    alignment: Alignment.center,
                    child: Text(
                      title,
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
                          color: Color.fromRGBO(234, 225, 186, 1),
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
