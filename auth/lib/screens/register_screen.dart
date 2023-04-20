import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/models/user.dart';
import 'package:lopes_talk/providers/auth_provider.dart';
import 'package:lopes_talk/providers/user_provider.dart';

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
  RegistrationScreen({super.key});

  // Move TextEditingController instances here
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final List<String> pronouns = ['she/her', 'he/him', 'they/them', 'other'];
    final String selectedPronoun = ref.watch(pronounsNotifierProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
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
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Text(
                      "Pronouns",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  for (String pronoun in pronouns)
                    ListTile(
                      tileColor: const Color.fromRGBO(215, 215, 175, .75),
                      title: Text(pronoun),
                      leading: Radio<String>(
                        value: pronoun,
                        groupValue: selectedPronoun,
                        onChanged: (String? value) {
                          if (value != null) {
                            ref
                                .read(pronounsNotifierProvider.notifier)
                                .changePronoun(value);
                          }
                        },
                      ),
                    ),
                  const SizedBox(height: 16),
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
                  ElevatedButton.icon(
                    onPressed: () =>
                        ref.watch(authRepositoryProvider).registerWithGoogle(),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(171, 178, 109, 1),
                      ),
                    ),
                    icon: Image.asset(
                      'assets/images/g-logo.png',
                      height: 20,
                    ),
                    label: const Text(
                      'Register with Google',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          // Attempt to register the user
                          final authService = ref.watch(authRepositoryProvider);
                          final registerError =
                              await authService.registerWithUserNameAndPassword(
                            User(
                              id: '',
                              userName: usernameController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              pronouns: selectedPronoun,
                              password: passwordController.text,
                            ),
                          );
                          ref
                              .read(userProvider.notifier)
                              .updateError(registerError);
                          ref.refresh(userProvider);

                          if (registerError.isNotEmpty) {
                            // Registration failed
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(registerError)),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Registration Sucess!')),
                            );
                            Navigator.pop(context);
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
