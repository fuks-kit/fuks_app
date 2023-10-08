import 'package:flutter/material.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

const _patrickImage =
    'https://media.licdn.com/dms/image/D5603AQFN_mG7il0cLQ/profile-displayphoto-shrink_400_400/0/1661528784896?e=1701907200&v=beta&t=cHWdG-4Vy_any8hqdnwSrnuKuOpp9VpiDpeuz0uYDyE';
const _leonImage =
    'https://media.licdn.com/dms/image/C5603AQEi5v7AKQo4Sg/profile-displayphoto-shrink_800_800/0/1610125447745?e=1701907200&v=beta&t=WsBnLBomNHqfe35PW1Z03xCDhllqz4JT7F5AYeNbGyw';
const _niklasImage =
    'https://media.licdn.com/dms/image/D4E03AQG13yn0qCIuIw/profile-displayphoto-shrink_800_800/0/1676229815392?e=1701907200&v=beta&t=rb9Y1ODsOfOEuW7M4t1gkX3-WTqWqEV2FmkqAfey3wg';
const _konstantinImage =
    'https://media.licdn.com/dms/image/D4E03AQHT7xyC5spfMA/profile-displayphoto-shrink_800_800/0/1684668187664?e=1701907200&v=beta&t=S1X9Tggacl0Aoi3_Mc4WiR6-q-MkLgw0Q32F4wG2cWE';
const _didemImage =
    'https://media.licdn.com/dms/image/C4E03AQFwnYiDMJ4SNA/profile-displayphoto-shrink_800_800/0/1654071665281?e=1701907200&v=beta&t=2CyzdJrrwNpp4GNMOuD1Vj8wCPVsIY3yLNHgFyjHf3o';
const _dominikImage =
    'https://media.licdn.com/dms/image/C5603AQFfFXyk8r7JzA/profile-displayphoto-shrink_800_800/0/1619775711272?e=1701907200&v=beta&t=2-XhHGkuIzMFrGdI1nKXQWcHP5Q5eWdC1XQLHwxuU-A';
const _claraImage =
    'https://media.licdn.com/dms/image/D4E03AQG3Jupbukiadw/profile-displayphoto-shrink_800_800/0/1689078858601?e=1701907200&v=beta&t=H524lqOjkN1Fav5uV8h-UH1XrJHFBNSyjIeofWvK420';
const _ninaImage =
    'https://media.licdn.com/dms/image/D4E03AQF41UzsZ2mFnA/profile-displayphoto-shrink_800_800/0/1683558057709?e=1701907200&v=beta&t=nbr0Q8bGQ9VOWhq4ExwoZbc-CCJyBYOV6wF8vNeOjr4';
const _jeanImage =
    'https://fuks.org/wp-content/uploads/2023/07/JeanGBLKT_sqaure-Benutzerdefiniert-modified-300x300.png';
const _karinImage =
    'https://fuks.org/wp-content/uploads/2023/07/KarinGBLCK_square-Benutzerdefiniert-modified-300x300.png';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  static const String route = 'project';

  @override
  State<StatefulWidget> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final titleStyle = textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.w500,
    );
    final subtitleStyle = textTheme.bodyMedium!.copyWith(
      color: colorScheme.outline,
    );

    return Scaffold(
      appBar: AppBar(),
      body: ConstrainedListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text(
              'Erstellung Kostenkalkulation',
              style: titleStyle,
            ),
          ),
          ListTile(
            title: Text(
              'Projekt Leitung',
              style: textTheme.titleMedium,
            ),
            subtitle: Text(
              'niklas.huebschle@fuks.org',
              style: subtitleStyle,
            ),
            trailing: const CircleAvatar(
              backgroundImage: NetworkImage(_niklasImage),
            ),
            onTap: () {
              launchUrlString('mailto:niklas.huebschle@fuks.org');
            },
          ),
          ListTile(
            title: Text(
              'Ausgangssituation',
              style: textTheme.titleMedium,
            ),
            subtitle: Text(
              'Unser Kunde ist ein bekanntes, größeres Unternehmen aus der Region und gerade dabei, ein neues Anwendungszentrum für die eigene Forschung zu bauen. Während die Aufgaben grundsätzlich klar und verteilt sind, fehlt eine zentrale koordinierende Hand, bei der alle Fäden zusammenlaufen - hier kommen wir ins Spiel.',
              style: subtitleStyle,
            ),
          ),
          ListTile(
            title: Text(
              'Projektaufgaben',
              style: textTheme.titleMedium,
            ),
            subtitle: Text(
              'Ziel des Projektes ist die Erstellung einer Kostenkalkulation, das Aufsetzen eines Wissensmanagementsystems und die Unterstützung des Projektmanagements, bei der unsere externe Sichtweise und Erfahrung gefragt sind',
              style: subtitleStyle,
            ),
          ),
          ListTile(
            title: Text(
              'Projektstellen',
              style: textTheme.titleMedium,
            ),
            subtitle: Text(
              'Für die Stelle als Projektmitglied sind keine expliziten Vorkenntnisse erforderlich, Erfahrung bei Kostenkalkulation und Grundkenntnisse in MS Excel sind ein Plus aber lasst Euch nicht abschrecken. Eigenständiges Arbeiten und ein hohes Maß an Lernbereitschaft sind allerdings wichtig.',
              style: subtitleStyle,
            ),
          ),
          ListTile(
            title: Text(
              'Eure Bewerbung',
              style: textTheme.titleMedium,
            ),
            subtitle: Text(
              'Bitte bewerbt Euch bis Sonntag, 08.10.2023 12:00 bei mir und Alexander Böhle (in CC) per E-Mail mit folgende\n- Lebenslauf\n- 2-3 Sätze zu Deiner Motivatio\n- Excel mit Bewerberinformationen (siehe Anhang)\n- Deine zeitliche Verfügbarkeit bis Ende Januar',
              style: subtitleStyle,
            ),
          ),
        ],
      ),
    );
  }
}
