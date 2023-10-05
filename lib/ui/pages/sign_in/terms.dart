import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fuks_app/utils/terms_and_privacy.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall;
    final specialStyle = style?.copyWith(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.primary,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By signing up, you accept our ',
            style: style,
          ),
          TextSpan(
            text: 'Terms of Use',
            style: specialStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => showTermsAndConditions(),
          ),
          TextSpan(
            text: ' and ',
            style: style,
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: specialStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => showPrivacyPolicy(),
          ),
        ],
      ),
    );
  }
}
