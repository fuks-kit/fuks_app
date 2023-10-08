import 'package:flutter/material.dart';
import 'package:fuks_app/ui/pages/office/office_page.dart';
import 'package:fuks_app/ui/pages/project/project_page.dart';
import 'package:fuks_app/ui/pages/settings/settings_page.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/fuks_logo.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = 'home';

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    final actions = <Widget>[
      IconButton(
        icon: const Icon(Icons.key),
        tooltip: 'Office Access',
        onPressed: () {
          Navigator.pushNamed(context, OfficePage.route);
        },
      ),
      IconButton(
        icon: const Icon(Icons.settings),
        tooltip: 'Settings',
        onPressed: () {
          SettingsPage.show(context);
        },
      ),
    ];

    final projectsBody = ConstrainedListView(
      padding: const EdgeInsets.all(8),
      children: [
        Container(
          // elevation: 4,
          margin: const EdgeInsets.all(8),
          // padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: colorScheme.outlineVariant,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hiring!',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Erstellung Kostenkalkulation',
                        style: titleStyle,
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 16),
                ListTile(
                  title: Text(
                    'Ziel des Projektes ist die Erstellung einer Kostenkalkulation, das Aufsetzen eines Wissensmanagementsystems und die Unterstützung des Projektmanagements, bei der unsere externe Sichtweise und Erfahrung gefragt sind',
                    style: subtitleStyle,
                  ),
                ),
                ListTile(
                  trailing: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ProjectPage.route);
                    },
                    child: Text(
                      'Mehr erfahren',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    final ktBody = ConstrainedListView(
      children: [
        ListTile(
          title: Text(
            'KT 63 – Erinnerungen',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'In der aktuellen Ausgabe geht es um das Thema "Erinnerungen" und wie sie in verschiedenen Lebensbereichen eine Rolle spielen',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
          ),
          onTap: () {
            launchUrlString(
                'https://fuks.org/wp-content/uploads/2023/07/KT_63-fuer-Online.pdf');
          },
          trailing: Image.network(
            'https://fuks.org/wp-content/uploads/2023/07/Screenshot-2023-07-03-191711.png',
          ),
        ),
        const Divider(height: 32, thickness: 0.5),
        ListTile(
          title: Text(
            'KT 61 – Zufall',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Die Autoren erkunden das Unberechenbare und Unerklärliche, das oft als Zufall wahrgenommen wird. Sie betonen jedoch, dass viele scheinbar zufällige Ereignisse durch Logik und Wissenschaft erklärt werden können',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
          ),
          onTap: () {
            launchUrlString(
                'https://fuks.org/wp-content/uploads/2022/09/KT61-Zufall.pdf');
          },
          trailing: Image.network(
            'https://fuks.org/wp-content/uploads/2022/09/KT61xxxxxxxx-6.jpg',
          ),
        ),
      ],
    );

    final eventsBody = ConstrainedListView(
      children: [
        const SizedBox(height: 24),
        ListTile(
          title: Text(
            'Hello You!',
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            'Alle events hier sind öffentlich. '
            'Wenn du dich für fuks interessierst, komm einfach vorbei! '
            'Solltest du fragen haben: Schreibe uns eine E-Mail an kontakt@fuks.org',
          ),
        ),
        const SizedBox(height: 24),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: colorScheme.outlineVariant,
              width: 1,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.pin_drop),
              ),
            ],
          ),
          title: Text(
            'Teamtreffen',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          subtitle: Text(
            'Das Teamtreffen findet jeden zweiten Dienstag um 19 Uhr statt',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: colorScheme.outlineVariant,
              width: 1,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.pin_drop),
              ),
            ],
          ),
          title: Text(
            'IT-Teamtreffen',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          subtitle: Text(
            'Das nächste IT-Teamtreffen findet am 14.12.2021 um 19 Uhr statt',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
          ),
        ),
      ],
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const FuksLogo(),
          actions: actions,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Events'),
              Tab(text: 'Projekte'),
              Tab(text: 'Karlsruhe Transfer'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            eventsBody,
            projectsBody,
            ktBody,
          ],
        ),
      ),
    );
  }
}
