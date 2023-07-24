import 'package:flutter/material.dart';
import 'package:fuks_app/services/doorman.dart';
import 'package:fuks_app/ui/dialogs/error.dart';
import 'package:undraw/undraw.dart';

class AccessScaffold extends StatelessWidget {
  const AccessScaffold({
    super.key,
    this.actions,
  });

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Access Granted',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: actions,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 250,
                height: 250,
                child: UnDraw(
                  illustration: UnDrawIllustration.agree,
                  color: colorScheme.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FilledButton.icon(
                onPressed: () {
                  doorman.openDoor().catchError(
                      (error, trace) => showErrorInfo(context, error, trace));
                },
                icon: const Icon(Icons.key),
                label: const Text('Open door'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
