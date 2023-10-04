import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuks_app/generated/doorman.pb.dart';
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
      message =
          'You signed in with your fuks account. When you become an active member, you will have access to the office';
    } else {
      message =
          'If you are a VWI member, please give your board your User ID to get access to the office';
    }

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
          color: colorScheme.secondary,
        ),
        const SizedBox(height: 60),
        Text(
          'You don\'t have access!',
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
              TextButton.icon(
                onPressed: () {
                  // Copy user id to clipboard
                  final auth = FirebaseAuth.instance;

                  Clipboard.setData(
                    ClipboardData(text: auth.currentUser?.uid ?? ''),
                  );

                  // SnackBar to notify user
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('User ID copied to clipboard'),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.secondary,
                ),
                icon: const Icon(Icons.copy),
                label: const Text('User ID'),
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
              label: const Text('Refresh'),
            ),
          ],
        ),
      ],
    );
  }
}
