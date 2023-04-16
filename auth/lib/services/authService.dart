import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final String baseUrl;
  final GoogleSignIn _googleSignIn;
  final UserNotifier _userNotifier;

  AuthService({
    required this.baseUrl,
    required GoogleSignIn googleSignIn,
    required UserNotifier userNotifier,
  })  : _googleSignIn = googleSignIn,
        _userNotifier = userNotifier;

  Future<User?> signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        final response = await http.post(
          Uri.parse('https://example.com/authenticate-with-google'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userName': user.email,
            'password': user.id,
          }),
        );

        if (response.statusCode == 200) {
          // Authentication was successful
          final userData = json.decode(response.body);
          final user = User(
            id: userData['id'],
            userName: userData['userName'],
            firstName: userData['firstName'],
            lastName: userData['lastName'],
            pronouns: userData['pronouns'],
          );
          _userNotifier.setUser(user);
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

  Future<User?> signInWithUserNameAndPassword(
      String username, String password) async {
    try {
      final String apiUrl = '$baseUrl/login';
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'userName': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Authentication was successful
        final userData = json.decode(response.body);
        final user = User(
          id: userData['id'],
          userName: userData['userName'],
          firstName: userData['firstName'],
          lastName: userData['lastName'],
          pronouns: userData['pronouns'],
        );
        print(user);
        _userNotifier.setUser(user);
      } else {
        // Authentication failed
        print('Authentication failed with status code ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e, stackTrace) {
      // Handle errors here
      print('Error during authentication: $e');
      print('Stack trace:\n$stackTrace');
    }
    return null;
  }

  Future<User?> registerWithUserNameAndPassword(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'userName': user.userName,
          'firstName': user.firstName,
          'lastName': user.lastName,
          'pronouns': user.pronouns,
          'password': user.password,
        }),
      );

      if (response.statusCode == 200) {
        // Registration was successful
        final userData = json.decode(response.body);
        final user = User(
          id: userData['id'],
          userName: userData['userName'],
          firstName: userData['firstName'],
          lastName: userData['lastName'],
          pronouns: userData['pronouns'],
        );

        _userNotifier.setUser(user);
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
