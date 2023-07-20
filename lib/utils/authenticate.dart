import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'html_shim.dart' if (dart.library.html) 'dart:html' show window;

class Authenticate {
  static Future<OAuthCredential> googleCredential() async {
    String? clientId;

    if (kIsWeb) {
      clientId =
          '350005315493-1vff0rjmc1jbvma4udc15tp64153ik93.apps.googleusercontent.com';
    }

    final googleSignInAccount = await GoogleSignIn(
      clientId: clientId,
    ).signIn();

    final googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    return GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
  }

  static Future<OAuthCredential> appleCredential() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oAuthProvider = OAuthProvider("apple.com");
    return oAuthProvider.credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );
  }

  static Future<AuthCredential> credentialsForUserInfo(UserInfo data) async {
    switch (data.providerId) {
      case "google.com":
        return Authenticate.googleCredential();
      case "apple.com":
        return Authenticate.appleCredential();
      default:
        throw Exception("No credentials for providerId ${data.providerId}");
    }
  }
}
