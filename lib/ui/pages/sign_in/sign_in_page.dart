import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fuks_app/ui/pages/sign_in/sign_in_apple.dart';
import 'package:fuks_app/ui/pages/sign_in/sign_in_button.dart';
import 'package:fuks_app/ui/pages/sign_in/sign_in_google.dart';
import 'package:fuks_app/ui/pages/sign_in/terms.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error.dart';
import 'package:fuks_app/ui/widgets/fuks_logo.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const route = 'sign-in';

  void _signInWithCredentials(
    BuildContext context,
    AuthCredential credentials,
  ) {
    FirebaseAuth.instance.signInWithCredential(credentials).catchError(
          (error, stack) => showErrorInfo(context, error, stack),
        );
  }

  void _signInAnonymously(BuildContext context) {
    FirebaseAuth.instance.signInAnonymously().catchError(
          (error, stack) => showErrorInfo(context, error, stack),
        );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final buttons = <Widget>[
      if (!kIsWeb && (Platform.isIOS || Platform.isMacOS))
        ListTile(
          title: AppleSignInButton(
            onCredentials: (credentials) =>
                _signInWithCredentials(context, credentials),
          ),
        ),
      ListTile(
        title: GoogleSignInButton(
          onCredentials: (credentials) =>
              _signInWithCredentials(context, credentials),
        ),
      ),
      if (!kIsWeb)
        ListTile(
          title: SignInButton(
            text: 'Skip',
            onPressed: () => _signInAnonymously(context),
          ),
        ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedListView(
            maxWidth: 400,
            shrinkWrap: true,
            primary: false,
            children: [
              Text(
                'Sign in',
                textAlign: TextAlign.center,
                style: textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 54),
              const FuksIcon(size: 128),
              const SizedBox(height: 54),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: buttons,
              ),
              const SizedBox(height: 54),
              const ListTile(
                title: TermsAndConditions(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
