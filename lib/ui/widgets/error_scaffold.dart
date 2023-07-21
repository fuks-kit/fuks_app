import 'package:flutter/material.dart';
import 'package:fuks_app/utils/error.dart';
import 'package:ms_undraw/ms_undraw.dart';

class ErrorScaffold extends StatelessWidget {
  const ErrorScaffold({
    super.key,
    this.error,
  });

  final Object? error;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Error',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              height: 200,
              width: 200,
              child: UnDraw(
                illustration: UnDrawIllustration.fixing_bugs,
                color: colorScheme.error,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 26,
              ),
              alignment: Alignment.center,
              child: Text(ErrorUtils.toText(error)),
            ),
          ],
        ),
      ),
    );
  }
}
