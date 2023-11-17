import 'package:flutter/material.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:undraw/undraw.dart';

class NotInReach extends StatelessWidget {
  const NotInReach({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedListView(
      shrinkWrap: true,
      primary: false,
      maxWidth: 400,
      children: [
        UnDraw(
          width: 256,
          height: 256,
          padding: const EdgeInsets.all(8),
          illustration: UnDrawIllustration.best_place,
          color: colorScheme.primary,
        ),
        const SizedBox(height: 8),
        ListTile(
          title: Text(
            'Nicht in Reichweite',
            textAlign: TextAlign.start,
            style: textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            'Achte auf folgende Punkte:',
            textAlign: TextAlign.start,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.outline,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          leading: Icon(
            Icons.bluetooth,
            color: colorScheme.primary,
          ),
          title: const Text('Dein Bluetooth ist muss aktiviert sein'),
        ),
        ListTile(
          leading: Icon(
            Icons.location_on,
            color: colorScheme.primary,
          ),
          title:
              const Text('Du musst dich in der Nähe des fuks Büros befinden'),
        ),
        ListTile(
          leading: Icon(
            Icons.timer,
            color: colorScheme.primary,
          ),
          title: const Text(
            'Es kann bis zu 30 Sekunden dauern, bis dein Gerät erkannt wird',
          ),
        ),
        // subtitle,
        const SizedBox(height: 60),
      ],
    );
  }
}
