import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      appBar: AppBar(
        title: const Text(
          'About',
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
          children: const [
            BigCard(
                title: 'Why?',
                body:
                    "For my beloved, Cindy.\nThe purpose of the app is to aid GCU students, captilizing on self-care! When you take care of yourself you can not only improve your mental health but your physcial health! Even if it's 5 minutes in your morning, it makes a huge impact.\nEnjoy ૮꒰⸝⸝>  ̫ <⸝⸝꒱ა"),
            BigCard(
                title: 'Behind the Creator',
                body:
                    "My name is Jesseña however I prefer Seña(sen-yuh). I created this app during my senior year for my capstone project. I'm 21 years old (plz I know I'm old—). My interests are KPOP, anime, manga streaming and playing video games!"),
            BigCard(
                title: 'Contact',
                body:
                    "For any recommendations or bugs in the app please contact me @JQuinones13@my.gcu.edu! In the subject line please put \"LopesTalk—[Issue/recommendation]\" so that I do not accidently skip over your email!"),
            BigCard(
                title: 'Donations/Support',
                body:
                    "If you would love to help a sturggling college student you can do so! Or if you would like to request a feature in the app! My Venmo is \"Sena-Quinones\" Thank you all for downloading LopesTalk! \nhappy cat for you! ฅ^•ﻌ•^ฅ"),
          ],
        ),
      ),
    );
  }
}

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
