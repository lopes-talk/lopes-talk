import 'package:auth/models/user.dart';
import 'package:auth/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/authService.dart';

class PronounsNotifier extends StateNotifier<String> {
  PronounsNotifier() : super('she/her');

  void changePronoun(String newPronoun) {
    state = newPronoun;
  }
}

final pronounsNotifierProvider =
    StateNotifierProvider<PronounsNotifier, String>((ref) {
  return PronounsNotifier();
});

class RegistrationScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _firstNameController = TextEditingController();
    final TextEditingController _lastNameController = TextEditingController();
    final List<String> _pronouns = ['she/her', 'he/him', 'they/them', 'other'];
    final String _selectedPronoun = ref.watch(pronounsNotifierProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: const [
                  Padding(
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
                  Padding(
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
                ],
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Text(
                      "Pronouns",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  for (String pronoun in _pronouns)
                    ListTile(
                      tileColor: const Color.fromRGBO(215, 215, 175, .75),
                      title: Text(pronoun),
                      leading: Radio<String>(
                        value: pronoun,
                        groupValue: _selectedPronoun,
                        onChanged: (String? value) {
                          if (value != null) {
                            ref
                                .read(pronounsNotifierProvider.notifier)
                                .changePronoun(value);
                          }
                        },
                      ),
                    ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
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
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
                  child: SizedBox(
                    height: 33,
                    width: 125,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Attempt to register the user
                          final authService = ref.watch(authRepositoryProvider);
                          final user =
                              await authService.registerWithUserNameAndPassword(
                            User(
                              id: '',
                              userName: _usernameController.text,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              pronouns: _selectedPronoun,
                              password: _passwordController.text,
                            ),
                          );

                          if (user != null) {
                            // Registration successful
                            Navigator.pop(context);
                          } else {
                            // Registration failed
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Registration failed')),
                            );
                          }
                        }
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(171, 178, 109, 1),
                        ),
                      ),
                      child: const Text(
                        'Register :D',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
