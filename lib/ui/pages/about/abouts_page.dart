import 'package:flutter/material.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/fuks_logo.dart';

const _about =
    '''Wir sind einer der ältesten Hochschulgruppen des KITs. fuks ist ein Ort der Motivation und Möglichkeiten. Wir bieten dir die Chance, echte Praxiserfahrung in Beratungsprojekten mit namhaften Unternehmen zu sammeln. Deinen Kommilitonen mit der Organisation von Crashkurse beim Bestehen von Klausuren helfen. Als Autor oder Layouter für unser Magazin “Karlsruher Transfer” kannst du deine schriftstellerischen Fähigkeiten entwickeln und deine Gedanken teilen.

Unsere internen Teams, Marketing und IT, sind das Rückgrat von fuks. Das Marketing-Team gestaltet unseren Außenauftritt wie unsere Webseite und unseren Social Media Auftritt, während das IT-Team unsere Infrastruktur verwaltet und unser Wissen managt.

Doch bei fuks geht es nicht nur um Arbeit. Wir organisieren auch spannende Events wie das Hüttenwochenende und Skiwochenenden für unvergessliche Erlebnisse und neue Freundschaften.

Wenn du bereit bist, dich herauszufordern und zu wachsen, dann schließe dich uns an und sei Teil unseres inspirierenden Teams bei fuks! Wir freuen uns darauf, dich kennenzulernen und gemeinsam die Zukunft zu gestalten.
''';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const String route = 'about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FuksLogo(),
      ),
      body: const AboutsBody(),
    );
  }

  static void show(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}

class AboutsBody extends StatelessWidget {
  const AboutsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedListView(
      children: [
        ListTile(
          title: Text(
            'Wer sind wir?',
            style: textTheme.displaySmall,
          ),
          subtitle: const Text(_about),
        ),
      ],
    );
  }
}
