import 'package:http/http.dart' as http;
import 'package:lopes_talk/providers/user_provider.dart';
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
          Uri.parse('$baseUrl/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userName': user.email,
            'password': user.email + user.id,
          }),
        );
        var responseData = json.decode(response.body);

        if (response.statusCode == 200) {
          // Authentication was successful
          final userData = responseData['data'];
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

  Future<String> registerWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        final response = await http.post(
          Uri.parse('$baseUrl/register'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'userName': user.email,
            'firstName': user.email,
            'lastName': user.email,
            'pronouns': 'OTHER',
            'password': user.email + user.id,
          }),
        );

        var responseData = json.decode(response.body);

        if (response.statusCode == 200) {
          // Registration was successful

          final userData = responseData['data'];
          final newUser = User(
            id: userData['id'],
            userName: userData['userName'],
            firstName: userData['firstName'],
            lastName: userData['lastName'],
            pronouns: userData['pronouns'],
          );

          _userNotifier.setUser(newUser);
          return '';
        } else if (response.statusCode == 409) {
          // If a user already exists - 409
          return responseData['message'];
        } else if (response.statusCode == 401) {
          // If validation errors occur cause of input invalid - 400
          return responseData['message'];
        } else if (response.statusCode == 400) {
          // Registration failed
          List<dynamic> errors = responseData['errors'];
          return errors.join('\n');
        }
      }
    } catch (e) {
      // Register Failure Generic (500)
      return 'Error during registration: $e';
    }
    return '';
  }

  Future<String> signInWithUserNameAndPassword(
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
        var responseData = json.decode(response.body);
        final userData = responseData['data'];
        final user = User(
          id: userData['id'],
          userName: userData['userName'],
          firstName: userData['firstName'],
          lastName: userData['lastName'],
          pronouns: userData['pronouns'],
        );
        _userNotifier.setUser(user);
        return '';
      } else {
        // Authentication failed
        print('Authentication failed with status code ${response.statusCode}');
        print('Response body: ${response.body}');
        return 'Login failed. Please check your credentials and try again.'; // Return an error message
      }
    } catch (e, stackTrace) {
      // Handle errors here
      print('Error during authentication: $e');
      print('Stack trace:\n$stackTrace');
      return 'An error occurred during login. Please try again later.'; // Return an error message
    }
  }

  Future<String> registerWithUserNameAndPassword(User user) async {
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
      var responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        // Registration was successful

        final userData = responseData['data'];
        final newUser = User(
          id: userData['id'],
          userName: userData['userName'],
          firstName: userData['firstName'],
          lastName: userData['lastName'],
          pronouns: userData['pronouns'],
        );

        _userNotifier.setUser(newUser);
        return '';
      } else if (response.statusCode == 409) {
        // If a user already exists - 409
        return responseData['message'];
      } else if (response.statusCode == 401) {
        // If validation errors occur cause of input invalid - 400
        return responseData['message'];
      } else if (response.statusCode == 400) {
        // Registration failed
        List<dynamic> errors = responseData['errors'];
        return errors.join('\n');
      }
    } catch (e) {
      // Register Failure Generic (500)
      return 'Error during registration: $e';
    }
    return '';
  }
}
