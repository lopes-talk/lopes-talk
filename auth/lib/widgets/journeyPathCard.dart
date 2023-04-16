import 'package:flutter/material.dart';

class JourneyPathCard extends StatelessWidget {
  const JourneyPathCard({
    Key? key,
    required this.title,
    required this.body,
    required this.active,
  }) : super(key: key);

  final String title;
  final String body;
  final bool active;

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
                        fontSize: 25,
                        color: Color.fromRGBO(234, 225, 186, 1),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/journeyTasks');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(171, 178, 109, 1),
                                ),
                                child: const Text(
                                  'See More',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black),
                                )),
                          ),
                        ),
                        Visibility(
                          visible: !active,
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(171, 178, 109, 1),
                                  ),
                                  child: const Text(
                                    'Follow Path',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
