import 'package:flutter/material.dart';
import 'package:fuks_app/ui/pages/events/events_page.dart';
import 'package:fuks_app/ui/pages/home/header.dart';
import 'package:fuks_app/ui/pages/kt/kt_page.dart';
import 'package:fuks_app/ui/pages/projects/projects_body.dart';
import 'package:fuks_app/ui/pages/office/office_page.dart';
import 'package:fuks_app/ui/pages/settings/settings_page.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/fuks_logo.dart';
import 'package:undraw/illustrations.g.dart';

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
      fontWeight: FontWeight.w600,
    );
    final subtitleStyle = textTheme.bodySmall?.copyWith(
      color: colorScheme.outline,
    );

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
          const HeaderWithIllustration(
            title: 'Willkommen!',
            subtitle:
                'Wir sind studentische Unternehmensberatung fuks e.V. aus Karlsruhe',
            illustration: UnDrawIllustration.positive_attitude,
            dimension: 200,
          ),
          ListTile(
            onTap: () => EventsPage.show(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: const CircleAvatar(
              child: Icon(Icons.event),
            ),
            title: Text(
              'Events',
              style: titleStyle,
            ),
            subtitle: Text(
              'Nehm an unseren Events teil und lerne uns kennen',
              style: subtitleStyle,
            ),
            trailing: const Icon(Icons.navigate_next),
          ),
          const SizedBox(height: 16),
          ListTile(
            onTap: () => ProjectsPage.show(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: const CircleAvatar(
              child: Icon(Icons.work),
            ),
            title: Text(
              'Projekte',
              style: titleStyle,
            ),
            subtitle: Text(
              'Unsere Projekte sind vielfältig und spannend',
              style: subtitleStyle,
            ),
            trailing: const Icon(Icons.navigate_next),
          ),
          const SizedBox(height: 16),
          ListTile(
            onTap: () => KTPage.show(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: const CircleAvatar(
              child: Icon(Icons.newspaper),
            ),
            title: Text(
              'Karlsruhe Transfer',
              style: titleStyle,
            ),
            subtitle: Text(
              'Der Karlsruhe Transfer ist ein Magazin für Studierende',
              style: subtitleStyle,
            ),
            trailing: const Icon(Icons.navigate_next),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
