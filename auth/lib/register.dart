import 'dart:convert';

import 'package:auth/login.dart';
import 'package:auth/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //  radioButtons call(none will be selected)
  String? pronouns;

  final _formKey = GlobalKey<FormState>();
  User user = User("", "");

  String url = "http://172.24.241.204:8080/register";
  Future save() async {
    print('in register');
    print(json.encode({'UserName': user.UserName, 'Password': user.Password}));
    print(Uri.parse(url));
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json
            .encode({'UserName': user.UserName, 'Password': user.Password}));

    print(res.body);
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
                'Register',
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
                'Create an Account!',
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
                  labelText: 'First Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your first name!';
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
                  labelText: 'Last Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your last name!';
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
                  labelText: 'Username',
                ),
                controller: TextEditingController(text: user.UserName),
                onChanged: (val) {
                  user.UserName = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a username!';
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
            Column(
              children: [
                const Text(
                  "Pronouns",
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: RadioListTile(
                      tileColor: const Color.fromRGBO(215, 215, 175, .75),
                      title: const Text('she/her'),
                      value: 'she/her',
                      groupValue: pronouns,
                      onChanged: (value) {
                        setState(() {
                          pronouns = value.toString();
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: RadioListTile(
                      tileColor: const Color.fromRGBO(215, 215, 175, .75),
                      title: const Text('he/him'),
                      value: 'he/him',
                      groupValue: pronouns,
                      onChanged: (value) {
                        setState(() {
                          pronouns = value.toString();
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: RadioListTile(
                      tileColor: const Color.fromRGBO(215, 215, 175, .75),
                      title: const Text('they/them'),
                      value: 'they/them',
                      groupValue: pronouns,
                      onChanged: (value) {
                        setState(() {
                          pronouns = value.toString();
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: RadioListTile(
                      tileColor: const Color.fromRGBO(215, 215, 175, .75),
                      title: const Text('Other'),
                      value: '',
                      groupValue: pronouns,
                      onChanged: (value) {
                        setState(() {
                          pronouns = value.toString();
                        });
                      }),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Text(
                "Already have an Account?",
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
                      'Register :)',
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
