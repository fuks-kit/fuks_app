import 'package:flutter/material.dart';
import 'package:fuks_app/generated/doorman/doorman.pb.dart';
import 'package:fuks_app/services/doorman.dart';
import 'package:fuks_app/ui/widgets/error.dart';
import 'package:fuks_app/ui/pages/office/access_timer.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:undraw/undraw.dart';

class AccessBody extends StatefulWidget {
  const AccessBody({
    super.key,
    required this.challenge,
  });

  final String challenge;

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
      backgroundColor: Colors.greenAccent,
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
        const UnDraw(
          width: 288,
          height: 192,
          padding: EdgeInsets.all(8),
          illustration: UnDrawIllustration.security_on,
          color: Colors.greenAccent,
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
          'Du hast Zugang zum Büro. Bitte achte darauf, dass du die Tür hinter dir schließt.',
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

            final req = Challenge()..id = widget.challenge;
            doorman.openDoor(req).then(_onSuccess).catchError(
              (error, trace) {
                setState(() => _loading = false);
                showErrorInfo(context, error, trace);
              },
            );
          },
          icon: _loading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : const Icon(Icons.key),
          label: const Text('Tür öffnen'),
          style: FilledButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            foregroundColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
