import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/providers/user_provider.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider<ApiService>(
  (ref) {
    final userNotifier = ref.watch(userProvider.notifier);
    return ApiService(
        baseUrl:
            'http://lopestalk-backend-app-env.us-west-1.elasticbeanstalk.com/api',
        userNotifier: userNotifier);
  },
);
