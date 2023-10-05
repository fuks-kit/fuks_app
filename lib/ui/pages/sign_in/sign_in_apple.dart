import 'package:flutter/material.dart';
import 'package:fuks_app/ui/widgets/error.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:fuks_app/ui/pages/sign_in/sign_in_button.dart';
import 'package:fuks_app/utils/authenticate.dart';

class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({
    super.key,
    this.title = 'Sign in with Apple',
    required this.onCredentials,
  });

  final String title;
  final OnCredentials onCredentials;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SignInButton(
      outlined: true,
      leadingBottomPadding: (4 / 44),
      icon: CustomPaint(
        painter: AppleLogoPainter(
          color: !isDark ? Colors.black : Colors.white,
        ),
      ),
      text: title,
      onPressed: () => Authenticate.appleCredential()
          .then((credentials) => onCredentials(credentials))
          .catchError(
            (error, stack) => showErrorInfo(context, error, stack),
          ),
    );
  }
}
