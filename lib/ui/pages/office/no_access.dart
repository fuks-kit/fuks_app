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

  final AccessCheckResponse permission;
  final VoidCallback? onRefresh;

  void _copyUserID(BuildContext context) {
    final auth = FirebaseAuth.instance;

    Clipboard.setData(
      ClipboardData(text: auth.currentUser?.uid ?? ''),
    );

    // SnackBar to notify user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Benutzer-ID wurde in die Zwischenablage kopiert',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final parentColor = Theme.of(context).colorScheme;

    return Theme(
      data: ThemeData(
        colorSchemeSeed: Colors.redAccent,
        brightness: Theme.of(context).brightness,
      ),
      child: Builder(builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;

        return ConstrainedListView(
          shrinkWrap: true,
          primary: false,
          maxWidth: 400,
          children: [
            UnDraw(
              width: 192,
              height: 192,
              padding: const EdgeInsets.all(8),
              illustration: UnDrawIllustration.starry_window,
              color: colorScheme.primary,
            ),
            const SizedBox(height: 24),
            ListTile(
              title: Text(
                'Zugang verweigert',
                textAlign: TextAlign.start,
                style: textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'So erhältst du Zugang zum Büro:',
                textAlign: TextAlign.start,
                style: textTheme.bodyMedium?.copyWith(
                  color: parentColor.outline,
                ),
              ),
            ),
            if (!permission.isFuks)
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: colorScheme.primary,
                ),
                title: const Text('Werde aktives fuks Mitglied'),
              ),
            if (!permission.isFuks)
              ListTile(
                leading: Icon(
                  Icons.chat_bubble,
                  color: colorScheme.primary,
                ),
                title: const Text(
                  'Gebe deine Benutzer-ID deinem Vorstand',
                ),
              ),
            if (permission.isFuks)
              ListTile(
                leading: Icon(
                  Icons.verified,
                  color: colorScheme.tertiary,
                ),
                title: const Text('Du bist fuks Mitglied'),
              ),
            if (permission.isFuks && !permission.isActiveFuks)
              ListTile(
                leading: Icon(
                  Icons.close,
                  color: colorScheme.primary,
                ),
                title: const Text('Du bist kein aktives fuks Mitglied'),
              ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton.tonalIcon(
                onPressed: () => _copyUserID(context),
                icon: const Icon(Icons.copy),
                label: const Text('Benutzer-ID'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton.tonalIcon(
                onPressed: () {
                  onRefresh?.call();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Wiederholen'),
              ),
            ),
          ],
        );
      }),
    );
  }
}
