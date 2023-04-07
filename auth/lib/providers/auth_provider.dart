import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    googleSignIn: GoogleSignIn(
      // The OAuth client id of your app. This is required.
      clientId:
          "441135317604-5d0l0990q4bh6nl99r2ve7o34cca85vl.apps.googleusercontent.com",
      // If you need to authenticate to a backend server, specify its OAuth client. This is optional.
      //serverClientId: '',
    ),
  ),
);

class AuthRepository {
  final GoogleSignIn _googleSignIn;

  AuthRepository({required GoogleSignIn googleSignIn})
      : _googleSignIn = googleSignIn;

  Future<User?> signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        final response = await http.post(
          Uri.parse('https://example.com/authenticate-with-google'),
          body: {
            'email': user.email,
            'name': user.displayName,
            'googleId': user.id,
          },
        );

        if (response.statusCode == 200) {
          // Authentication was successful
          final userData = json.decode(response.body);
          final user = User(
            id: userData['id'],
            userName: userData['name'],
            email: userData['email'],
            password: '',
          );
          return user;
        } else {
          // Authentication failed
          print(
              'Authentication failed with status code ${response.statusCode}');
        }
      }
    } catch (e) {
      // Handle errors here
      print('Error during authentication: $e');
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://example.com/authenticate'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Authentication was successful
        final userData = json.decode(response.body);
        final user = User(
          id: userData['id'],
          userName: userData['name'],
          email: userData['email'],
          password: '',
        );
        return user;
      } else {
        // Authentication failed
        print('Authentication failed with status code ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors here
      print('Error during authentication: $e');
    }
    return null;
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://example.com/register'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Registration was successful
        final userData = json.decode(response.body);
        final user = User(
          id: userData['id'],
          userName: userData['name'],
          email: userData['email'],
          password: '',
        );
        return user;
      } else {
        // Registration failed
        print('Registration failed with status code ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors here
      print('Error during registration: $e');
    }
    return null;
  }
}
