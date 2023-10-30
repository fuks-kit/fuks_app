import 'package:flutter/material.dart';
import 'package:fuks_app/ui/pages/events/events_page.dart';
import 'package:fuks_app/ui/pages/kt/kt_page.dart';
import 'package:fuks_app/ui/pages/projects/projects_body.dart';
import 'package:fuks_app/ui/pages/office/office_page.dart';
import 'package:fuks_app/ui/pages/settings/settings_page.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/fuks_logo.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

    final titleStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w700,
    );
    final subtitleStyle = textTheme.bodySmall?.merge(TextStyle(
      color: colorScheme.outline,
    ));

    return Scaffold(
      appBar: AppBar(
        title: const FuksLogo(),
        actions: [
          IconButton(
            icon: const Icon(Icons.key),
            tooltip: 'Büro Zugang',
            onPressed: () => OfficePage.show(context),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Einstellungen',
            onPressed: () => SettingsPage.show(context),
          ),
        ],
      ),
      body: ConstrainedListView(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: Text(
              'Erfolgreiche studentische Unternehmensberatung seit über 25 Jahren',
              style: textTheme.titleMedium,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 32,
            ),
            alignment: Alignment.center,
            child: const FuksIcon(
              size: 100,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: colorScheme.primary,
            ),
            minLeadingWidth: 32,
            title: Text(
              'Mehr über fuks',
              style: titleStyle,
            ),
            subtitle: Text(
              'https://fuks.org',
              style: subtitleStyle,
            ),
            onTap: () => launchUrlString('https://fuks.org'),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(
              Icons.event,
              color: colorScheme.primary,
            ),
            minLeadingWidth: 32,
            title: Text(
              'Events',
              style: titleStyle,
            ),
            subtitle: Text(
              'Nimm an einem unseren Events teil',
              style: subtitleStyle,
            ),
            onTap: () => EventsPage.show(context),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(
              Icons.lightbulb_outline,
              color: colorScheme.primary,
            ),
            minLeadingWidth: 32,
            title: Text(
              'Projekte',
              style: titleStyle,
            ),
            subtitle: Text(
              'Bringe dein Wissen in unsere Projekte ein',
              style: subtitleStyle,
            ),
            onTap: () => ProjectsPage.show(context),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(
              Icons.newspaper,
              color: colorScheme.primary,
            ),
            minLeadingWidth: 32,
            title: Text(
              'Karlsruhe Transfer',
              style: titleStyle,
            ),
            subtitle: Text(
              'Lese das Magazin für Studierende',
              style: subtitleStyle,
            ),
            onTap: () => KTPage.show(context),
          ),
        ],
      ),
    );
  }
}
