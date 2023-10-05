import 'package:flutter/material.dart';
import 'package:fuks_app/utils/error.dart';

dynamic showErrorInfo(BuildContext context, Object? error, StackTrace trace) {
  final colors = Theme.of(context).colorScheme;

  // debugPrintStack(label: error.toString(), stackTrace: trace);

  final snackBar = SnackBar(
    content: SelectableText(
      ErrorUtils.toText(error),
      style: TextStyle(
        color: colors.onError,
      ),
    ),
    backgroundColor: colors.error,
    duration: const Duration(seconds: 10),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
