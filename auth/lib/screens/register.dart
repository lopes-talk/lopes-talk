import 'dart:convert';

import 'package:auth/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final dateController = TextEditingController();
  //  radioButtons call(none will be selected)
  String? pronouns;

  final _formKey = GlobalKey<FormState>();
  User user = User(id: -1, userName: '', email: '', password: '');

  String url = "http://172.24.241.204:8080/register";
  Future save() async {
    print('in register');
    print(json.encode({'userName': user.userName, 'password': user.password}));
    print(Uri.parse(url));
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json
            .encode({'userName': user.userName, 'Password': user.password}));

    print(res.body);
  }

  @override
  void dispose() {
    //  clean controller when widget is removed
    dateController.dispose();
    super.dispose();
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
                controller: TextEditingController(text: user.userName),
                onChanged: (val) {
                  user.userName = val;
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
                controller: TextEditingController(text: user.password),
                onChanged: (val) {
                  user.password = val;
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    "Pronouns",
                    style: TextStyle(fontSize: 20),
                  ),
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
                // Container(
                //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //   child: RadioTheme(),
                // ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: InkWell(
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
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
                child: SizedBox(
                  height: 33,
                  width: 125,
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
                        'Register :D',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
