import 'package:flutter/material.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:undraw/undraw.dart';

class NotInReach extends StatelessWidget {
  const NotInReach({super.key});

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
          width: 256,
          height: 256,
          padding: const EdgeInsets.all(8),
          illustration: UnDrawIllustration.best_place,
          color: colorScheme.primary,
        ),
        const SizedBox(height: 60),
        Text(
          'Kein Doorman in Reichweite!',
          textAlign: TextAlign.center,
          style: textStyle.headlineSmall?.merge(const TextStyle(
            fontWeight: FontWeight.w500,
          )),
        ),
        const SizedBox(height: 8),
        Text(
          "Du musst dich in der Näche des fuks Büros befinden und Bluetooth aktiviert haben, um die Tür zu öffnen. "
          "Es kann bis zu 30 Sekunden dauern, bis dein Gerät erkannt wird.",
          textAlign: TextAlign.center,
          style: textStyle.bodyMedium?.merge(TextStyle(
            color: colorScheme.outline,
          )),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
