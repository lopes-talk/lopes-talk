import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, User?>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  String errorMessage = '';

  void setUser(User user) {
    state = user;
  }

  User? getUser() {
    return state;
  }

  void updateError(String error) {
    errorMessage = error;
  }
}
