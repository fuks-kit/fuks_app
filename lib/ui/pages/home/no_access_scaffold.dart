import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';

class NoAccessScaffold extends StatelessWidget {
  const NoAccessScaffold({
    super.key,
    this.actions,
  });

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'No Access',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: colorScheme.tertiary,
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
                  illustration: UnDrawIllustration.starry_window,
                  color: colorScheme.tertiary,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('No access to fuks office'),
            ),
          ],
        ),
      ),
    );
  }
}
