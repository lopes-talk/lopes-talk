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
        body: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Card(
                  color: const Color.fromRGBO(127, 102, 74, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Emotional",
                            textAlign: TextAlign.left,
                            style: TextStyle(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/journeyEmotional');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            171, 178, 109, 1),
                                      ),
                                      child: const Text(
                                        'See More',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            171, 178, 109, 1),
                                      ),
                                      child: const Text(
                                        'Follow Path',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Card(
                  color: const Color.fromRGBO(127, 102, 74, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Mental",
                            textAlign: TextAlign.left,
                            style: TextStyle(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/journeyMental');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            171, 178, 109, 1),
                                      ),
                                      child: const Text(
                                        'See More',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            171, 178, 109, 1),
                                      ),
                                      child: const Text(
                                        'Follow Path',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Card(
                  color: const Color.fromRGBO(127, 102, 74, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Physical",
                            textAlign: TextAlign.left,
                            style: TextStyle(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/journeyPhysical');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            171, 178, 109, 1),
                                      ),
                                      child: const Text(
                                        'See More',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            171, 178, 109, 1),
                                      ),
                                      child: const Text(
                                        'Follow Path',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Card(
                  color: const Color.fromRGBO(127, 102, 74, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Practical",
                            textAlign: TextAlign.left,
                            style: TextStyle(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/journeyPractical');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            171, 178, 109, 1),
                                      ),
                                      child: const Text(
                                        'See More',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            171, 178, 109, 1),
                                      ),
                                      child: const Text(
                                        'Follow Path',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Card(
                  color: const Color.fromRGBO(127, 102, 74, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Social",
                            textAlign: TextAlign.left,
                            style: TextStyle(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/journeySocial');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            171, 178, 109, 1),
                                      ),
                                      child: const Text(
                                        'See More',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            171, 178, 109, 1),
                                      ),
                                      child: const Text(
                                        'Follow Path',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      )),
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
          ),
        ));
  }
}
