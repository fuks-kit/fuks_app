import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuks_app/ui/pages/sign_in/sign_in_button.dart';
import 'package:fuks_app/ui/widgets/error.dart';
import 'package:fuks_app/utils/authenticate.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    super.key,
    this.title = 'Sign in with Google',
    required this.onCredentials,
  });

  final String title;
  final OnCredentials onCredentials;

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      text: title,
      outlined: true,
      onPressed: () => Authenticate.googleCredential()
          .then((credentials) => onCredentials(credentials))
          .catchError(
            (error, stack) => showErrorInfo(context, error, stack),
          ),
      icon: SvgPicture.asset("assets/Google__G__Logo.svg"),
    );
  }
}
