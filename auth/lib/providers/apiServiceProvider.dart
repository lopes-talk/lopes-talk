import 'package:auth/providers/userProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/apiService.dart';

final apiServiceProvider = Provider<ApiService>(
  (ref) {
    final userNotifier = ref.watch(userProvider.notifier);
    return ApiService(
        baseUrl: 'http://localhost:3001/api', userNotifier: userNotifier);
  },
);
