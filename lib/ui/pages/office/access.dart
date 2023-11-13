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
          illustration: UnDrawIllustration.fingerprint_login,
          color: Colors.greenAccent,
        ),
        const SizedBox(height: 24),
        ListTile(
          title: Text(
            'Du hast Zugang zum Büro!',
            textAlign: TextAlign.start,
            style: textStyle.headlineSmall?.merge(const TextStyle(
              fontWeight: FontWeight.w600,
            )),
          ),
          subtitle: Text(
            'Achte auf folgende Punkte:',
            textAlign: TextAlign.start,
            style: textStyle.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.meeting_room,
            color: Colors.greenAccent,
            // color: colorScheme.outline,
          ),
          title: Text('Schließe alle Türen und Fenster'),
        ),
        const ListTile(
          leading: Icon(
            Icons.delete,
            color: Colors.greenAccent,
          ),
          title: Text('Entsorge deinen Müll'),
        ),
        const ListTile(
          leading: Icon(
            Icons.light,
            color: Colors.greenAccent,
          ),
          title: Text('Schalte das Licht aus'),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: _loading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : const Icon(Icons.key, color: Colors.black),
          title: const Text(
            'Tür öffnen',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          tileColor: Colors.greenAccent,
          onTap: () {
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
        ),
        // const SizedBox(height: 60),
        // FilledButton.tonalIcon(
        //   onPressed: () {
        //     setState(() {
        //       _loading = true;
        //     });
        //
        //     final req = Challenge()..id = widget.challenge;
        //     doorman.openDoor(req).then(_onSuccess).catchError(
        //       (error, trace) {
        //         setState(() => _loading = false);
        //         showErrorInfo(context, error, trace);
        //       },
        //     );
        //   },
        //   icon: _loading
        //       ? const SizedBox(
        //           width: 24,
        //           height: 24,
        //           child: CircularProgressIndicator(
        //             color: Colors.black,
        //           ),
        //         )
        //       : const Icon(Icons.key),
        //   label: const Text('Tür öffnen'),
        //   style: FilledButton.styleFrom(
        //     backgroundColor: Colors.greenAccent,
        //     foregroundColor: Colors.black,
        //   ),
        // ),
      ],
    );
  }
}
