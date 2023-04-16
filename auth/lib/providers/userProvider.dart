import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, User?>((ref) => UserNotifier());
