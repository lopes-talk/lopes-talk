import 'package:auth/providers/userProvider.dart';
import 'package:auth/services/authService.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthService(
    userNotifier: ref.watch(userProvider.notifier),
    baseUrl: 'http://localhost:3001/api',
    googleSignIn: GoogleSignIn(
      // The OAuth client id of your app. This is required.
      clientId:
          "441135317604-5d0l0990q4bh6nl99r2ve7o34cca85vl.apps.googleusercontent.com",
      // If you need to authenticate to a backend server, specify its OAuth client. This is optional.
      //serverClientId: '',
    ),
  ),
);
