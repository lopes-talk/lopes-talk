import 'dart:convert';

import 'package:auth/register.dart';
import 'package:auth/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");

  String url = "http://172.24.241.204:8080/login";
  Future save() async {
    print('in login');
    print(json.encode({'UserName': user.UserName, 'Password': user.Password}));
    print(Uri.parse(url));
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json
            .encode({'UserName': user.UserName, 'Password': user.Password}));

    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 25, 8, 8),
              //padding: const EdgeInsets.all(8.0),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Zeyada',
                  color: Color.fromRGBO(138, 104, 34, 1),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'We missed you! Come join the fun!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Zeyada',
                  color: Color.fromRGBO(138, 104, 34, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  errorStyle: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(137, 0, 0, 1),
                  ),
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                ),
                controller: TextEditingController(text: user.UserName),
                onChanged: (val) {
                  user.UserName = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Username!';
                  }
                  return null;
                },
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  errorStyle: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(137, 0, 0, 1),
                  ),
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
                controller: TextEditingController(text: user.Password),
                onChanged: (val) {
                  user.Password = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password!';
                  }
                  return null;
                },
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Don't have an Account?",
                style: TextStyle(
                  fontFamily: 'Zeyada',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: SizedBox(
                height: 30,
                width: 123.28,
                child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        save();
                      }
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(171, 178, 109, 1))),
                    child: const Text(
                      'Login :)',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
