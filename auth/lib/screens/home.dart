import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import '../widgets/homeTaskCard.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              Center(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Quote(),
                ),
              ),
              const Image(
                width: 450,
                height: 350,
                image: AssetImage('android/assests/Lopey-removebg-preview.png'),
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
              const HomeTaskCard(title: 'Task to Complete', body: ""),
            ],
          ),
        ));
  }
}

class Quote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getQuote(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final quote = snapshot.data!['quote'];
            final author = snapshot.data!['author'];
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    quote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '- $author',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

/// Quotes are supplied by https://api.goprogram.ai/inspiration/docs/
Future<Map<String, dynamic>> _getQuote() async {
  print("Inside the get quotes");
  final response =
      await http.get(Uri.parse('https://api.goprogram.ai/inspiration'));
  if (response.statusCode == 200) {
    final decodedResponse = json.decode(response.body);
    final quote = decodedResponse['quote'];
    final author = decodedResponse['author'];
    print(response.body);
    return {'quote': quote, 'author': author};
  } else {
    throw Exception('Failed to load quote');
  }
}
