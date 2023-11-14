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

  void _onSuccess(DoorOpenResponse status) {
    setState(() => _loading = false);

    final duration = Duration(
      seconds: status.openDuration.seconds.toInt(),
    );

    AccessTimer.showSnackBar(context, duration);
  }

  void _onDoorOpen() {
    setState(() {
      _loading = true;
    });

    final req = DoorOpenRequest();
    req.challenge = widget.challenge;

    doorman.openDoor(req).then(_onSuccess).catchError(
      (error, trace) {
        setState(() => _loading = false);
        showErrorInfo(context, error, trace);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final parentColor = Theme.of(context).colorScheme;

    return Theme(
      data: ThemeData(
        colorSchemeSeed: Colors.greenAccent,
        brightness: Theme.of(context).brightness,
      ),
      child: Builder(
        builder: (context) {
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
                illustration: UnDrawIllustration.fingerprint,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 24),
              ListTile(
                title: Text(
                  'Zugang gewährt',
                  textAlign: TextAlign.start,
                  style: textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  'Achte auf folgende Punkte:',
                  textAlign: TextAlign.start,
                  style: textTheme.bodyMedium?.copyWith(
                    color: parentColor.outline,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.meeting_room,
                  color: colorScheme.primary,
                  // color: colorScheme.outline,
                ),
                title: const Text('Schließe alle Türen und Fenster'),
              ),
              ListTile(
                leading: Icon(
                  Icons.delete,
                  color: colorScheme.primary,
                ),
                title: const Text('Entsorge deinen Müll'),
              ),
              ListTile(
                leading: Icon(
                  Icons.light,
                  color: colorScheme.primary,
                ),
                title: const Text('Schalte das Licht aus'),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _onDoorOpen,
                  icon: _loading
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: colorScheme.primaryContainer,
                          ),
                        )
                      : const Icon(Icons.key),
                  label: const Text('Tür Öffnen'),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
