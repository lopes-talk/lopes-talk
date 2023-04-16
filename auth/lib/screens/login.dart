import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/authProvider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _userNameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 231, 206, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            TextFormField(
              controller: _userNameController,
              decoration: const InputDecoration(
                errorStyle: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(137, 0, 0, 1),
                ),
                border: UnderlineInputBorder(),
                hintText: 'Username',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an userName!';
                }
                return null;
              },
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
                errorStyle: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(137, 0, 0, 1),
                ),
              ),
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
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                final userName = _userNameController.text;
                final password = _passwordController.text;
                ref
                    .watch(authRepositoryProvider)
                    .signInWithUserNameAndPassword(userName, password);
              },
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
              child: const Text(
                'Login with User Name and password :)',
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () =>
                  ref.watch(authRepositoryProvider).signInWithGoogle(),
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
                'Sign in with Google',
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
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
            ),
          ],
        ),
      ),
    );
  }
}
