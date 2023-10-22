import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuks_app/generated/doorman/doorman.pb.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:undraw/undraw.dart';

class NoAccess extends StatelessWidget {
  const NoAccess({
    super.key,
    required this.permission,
    required this.onRefresh,
  });

  final OfficePermission permission;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    String message;
    if (permission.isFuksMember) {
      message = 'Sobald du aktives Mitglied wirst, erhältst du Zugang zum Büro';
    } else {
      message =
          'Wenn du VWI-Mitglied bist, gib bitte deinem Vorstand deine Benutzer-ID, um Zugang zum Büro zu erhalten';
    }

    return ConstrainedListView(
      shrinkWrap: true,
      primary: false,
      maxWidth: 400,
      children: [
        UnDraw(
          width: 256,
          height: 256,
          padding: const EdgeInsets.all(8),
          illustration: UnDrawIllustration.starry_window,
          color: colorScheme.secondary,
        ),
        const SizedBox(height: 60),
        Text(
          'Du hast keinen Zugang!',
          textAlign: TextAlign.center,
          style: textStyle.headlineSmall?.merge(const TextStyle(
            fontWeight: FontWeight.w500,
          )),
        ),
        const SizedBox(height: 8),
        Text(
          message,
          textAlign: TextAlign.center,
          style: textStyle.bodyMedium?.merge(TextStyle(
            color: colorScheme.outline,
          )),
        ),
        const SizedBox(height: 60),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            if (!permission.isFuksMember)
              OutlinedButton.icon(
                onPressed: () {
                  // Copy user id to clipboard
                  final auth = FirebaseAuth.instance;

                  Clipboard.setData(
                    ClipboardData(text: auth.currentUser?.uid ?? ''),
                  );

                  // SnackBar to notify user
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Benutzer-ID wurde in die Zwischenablage kopiert'),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.secondary,
                ),
                icon: const Icon(Icons.copy),
                label: const Text('Benutzer-ID'),
              ),
            FilledButton.icon(
              onPressed: () {
                onRefresh?.call();
              },
              style: FilledButton.styleFrom(
                foregroundColor: colorScheme.onSecondary,
                backgroundColor: colorScheme.secondary,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Wiederholen'),
            ),
          ],
        ),
      ],
    );
  }
}
