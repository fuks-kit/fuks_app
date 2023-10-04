import 'package:flutter/material.dart';
import 'package:fuks_app/generated/doorman.pb.dart';
import 'package:fuks_app/services/doorman.dart';
import 'package:fuks_app/ui/dialogs/error.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:undraw/undraw.dart';

class AccessBody extends StatelessWidget {
  const AccessBody({
    super.key,
    required this.permission,
  });

  final OfficePermission permission;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return ConstrainedListView(
      shrinkWrap: true,
      primary: false,
      maxWidth: 400,
      children: [
        UnDraw(
          width: 288,
          height: 192,
          padding: const EdgeInsets.all(8),
          illustration: UnDrawIllustration.login,
          color: colorScheme.primary,
        ),
        const SizedBox(height: 60),
        Text(
          'You can open the door!',
          textAlign: TextAlign.center,
          style: textStyle.headlineSmall?.merge(const TextStyle(
            fontWeight: FontWeight.w500,
          )),
        ),
        const SizedBox(height: 8),
        Text(
          'You must be on the fuks WiFi network to open the door',
          textAlign: TextAlign.center,
          style: textStyle.bodyMedium?.merge(TextStyle(
            color: colorScheme.outline,
          )),
        ),
        const SizedBox(height: 60),
        FilledButton.icon(
          onPressed: () {
            doorman.openDoor().catchError(
                (error, trace) => showErrorInfo(context, error, trace));
          },
          icon: const Icon(Icons.key),
          label: const Text('Open door'),
        ),
      ],
    );
  }
}
