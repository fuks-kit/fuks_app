import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuks_app/ui/pages/sign_in/sign_in_apple.dart';
import 'package:fuks_app/ui/pages/sign_in/sign_in_button.dart';
import 'package:fuks_app/ui/pages/sign_in/sign_in_google.dart';
import 'package:fuks_app/ui/pages/sign_in/terms.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/dialogs/error.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const route = 'sign-in';

  void _signInWithCredentials(
      BuildContext context, AuthCredential credentials) {
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
    final color = Theme.of(context).colorScheme;

    final buttons = <Widget>[
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
    ];

    if (!kIsWeb) {
      final skip = ListTile(
        title: SignInButton(
          text: 'Skip',
          onPressed: () => _signInAnonymously(context),
          outlined: true,
        ),
      );

      buttons.add(skip);
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedListView(
            maxWidth: 400,
            shrinkWrap: true,
            primary: false,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ListTile(
                  title: Column(
                    children: [
                      Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.merge(const TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                width: 192,
                height: 192,
                child: SvgPicture.asset(
                  "assets/fuks_logo.svg",
                  theme: SvgTheme(currentColor: color.primary),
                  colorFilter: ColorFilter.mode(
                    color.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: buttons,
                ),
              ),
              const ListTile(title: TermsAndConditions()),
            ],
          ),
        ),
      ),
    );
  }
}
