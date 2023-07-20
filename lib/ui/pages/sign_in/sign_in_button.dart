import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

typedef OnCredentials = void Function(AuthCredential credentials);

/// The scale based on the height of the button
const _appleIconSizeScale = 28 / 44;

/// A `Sign in with Apple` button according to the Apple Guidelines.
///
/// https://developer.apple.com/design/human-interface-guidelines/sign-in-with-apple/overview/buttons/
class SignInButton extends StatelessWidget {
  SignInButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.outlined = false,
    this.leadingBottomPadding = 0,
  });

  final bool outlined;
  final double leadingBottomPadding;

  /// The callback that is be called when the button is pressed.
  final VoidCallback onPressed;

  /// The text to display next to the Apple logo.
  ///
  /// Defaults to `Sign in with Apple`.
  final String text;

  /// The height of the button.
  ///
  /// This defaults to `44` according to Apple's guidelines.
  final double height = 44;

  /// The border radius of the button.
  ///
  /// Defaults to `8` pixels.
  final BorderRadius borderRadius = BorderRadius.circular(44.0);

  /// The icon.
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isDark ? Colors.white : Colors.black;
    final onBackground = isDark ? Colors.black : Colors.white;

    // per Apple's guidelines
    final fontSize = height * 0.43;

    final textWidget = Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        inherit: false,
        fontSize: fontSize,
        color: outlined ? background : onBackground,
        // defaults styles aligned with https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/cupertino/text_theme.dart#L16
        fontFamily: '.SF Pro Text',
        letterSpacing: -0.41,
      ),
    );

    Widget? leading;

    if (icon != null) {
      leading = Container(
        // color: Colors.green,
        width: _appleIconSizeScale * height,
        height: _appleIconSizeScale * height,
        padding: EdgeInsets.only(
          // Properly aligns the Apple icon with the text of the button
          bottom: leadingBottomPadding * height,
        ),
        child: Center(
          child: SizedBox(
            width: fontSize * (25 / 31),
            height: fontSize,
            child: icon,
          ),
        ),
      );
    }
    final body = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading ?? const SizedBox(),
          Expanded(
            child: textWidget,
          ),
        ],
      ),
    );

    Widget button;

    if (outlined) {
      button = OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          foregroundColor: background,
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: body,
      );
    } else {
      button = FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          backgroundColor: background,
          foregroundColor: onBackground,
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: body,
      );
    }

    return SizedBox(
      height: height,
      child: SizedBox.expand(
        child: button,
      ),
    );
  }
}
