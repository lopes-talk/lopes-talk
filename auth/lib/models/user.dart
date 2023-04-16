import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String id;
  final String userName;
  final String firstName;
  final String lastName;
  final String pronouns;
  String? password;

  User({
    required this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.pronouns,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      pronouns: json['pronouns'],
    );
  }

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'pronouns': pronouns,
    };
  }
}

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  void setUser(User user) {
    state = user;
  }

  User? getUser() {
    return state;
  }
}
