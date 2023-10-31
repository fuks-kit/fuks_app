import 'package:flutter/material.dart';
import 'package:fuks_app/generated/doorman/doorman.pb.dart';
import 'package:fuks_app/services/doorman.dart';
import 'package:fuks_app/ui/widgets/error.dart';
import 'package:fuks_app/ui/pages/office/access_timer.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:undraw/undraw.dart';

class AccessBody extends StatefulWidget {
  const AccessBody({super.key});

  @override
  State createState() => _AccessBodyState();
}

class _AccessBodyState extends State<AccessBody> {
  bool _loading = false;

  void _onSuccess(DoorState status) {
    setState(() => _loading = false);

    final duration = Duration(
      seconds: status.openDuration.seconds.toInt(),
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: duration,
      content: AccessTimer(duration: duration),
    ));
  }

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
          'Du kannst die Tür öffnen!',
          textAlign: TextAlign.center,
          style: textStyle.headlineSmall?.merge(const TextStyle(
            fontWeight: FontWeight.w500,
          )),
        ),
        const SizedBox(height: 8),
        Text(
          'Um die Tür zu öffnen, müssen du dich im Fuks-WLAN-Netzwerk befinden',
          textAlign: TextAlign.center,
          style: textStyle.bodyMedium?.merge(TextStyle(
            color: colorScheme.outline,
          )),
        ),
        const SizedBox(height: 60),
        FilledButton.tonalIcon(
          onPressed: () {
            setState(() {
              _loading = true;
            });

            doorman.openDoor().then(_onSuccess).catchError(
              (error, trace) {
                setState(() => _loading = false);
                showErrorInfo(context, error, trace);
              },
            );
          },
          icon: _loading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: colorScheme.onPrimary,
                  ),
                )
              : const Icon(Icons.key),
          label: const Text('Open Door'),
        ),
      ],
    );
  }
}
