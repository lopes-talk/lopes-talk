import 'package:flutter/material.dart';

class EditTask extends StatelessWidget {
  const EditTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      appBar: AppBar(
        title: const Text(
          'Edit Task',
          style: TextStyle(
            color: Color.fromRGBO(255, 253, 227, 1),
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
            child: RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Task',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Clean bathroom, read book, journal...',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(171, 178, 109, 1),
                    minimumSize: const Size(100, 29)),
                child: const Text(
                  'Edit Task',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                )),
          ),
        ],
      ),
    );
  }
}
