import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lopes_talk/providers/user_provider.dart';
import 'package:lopes_talk/services/auth_service.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthService(
    userNotifier: ref.watch(userProvider.notifier),
    baseUrl:
        'http://lopestalk-backend-app-env.us-west-1.elasticbeanstalk.com/api',
    googleSignIn: GoogleSignIn(
      // The OAuth client id of your app. This is required.
      clientId:
          "279762071305-bbelue057bt77ccbhf82c26d63abqhu8.apps.googleusercontent.com",
      // If you need to authenticate to a backend server, specify its OAuth client. This is optional.
      //serverClientId: '',
    ),
  ),
);
//441135317604-5d0l0990q4bh6nl99r2ve7o34cca85vl.apps.googleusercontent.com
