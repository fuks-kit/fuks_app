import 'package:flutter/material.dart';
import 'package:fuks_app/ui/pages/events/events_page.dart';
import 'package:fuks_app/ui/pages/kt/kt_page.dart';
import 'package:fuks_app/ui/pages/projects/projects_body.dart';
import 'package:fuks_app/ui/pages/office/office_page.dart';
import 'package:fuks_app/ui/pages/settings/settings_page.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/fuks_logo.dart';
import 'package:fuks_app/ui/widgets/outlined_card.dart';
import 'package:undraw/undraw.dart';
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
          OutlinedCard(
            borderColor: colorScheme.outlineVariant,
            margin: const EdgeInsets.all(8),
            child: ListTile(
              onTap: () => launchUrlString('https://fuks.org'),
              title: Text(
                'Mehr über fuks',
                style: titleStyle,
              ),
              subtitle: Text(
                'fuks ist eine studentische Unternehmensberatung am KIT',
                style: subtitleStyle,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ),
          OutlinedCard(
            borderColor: colorScheme.outlineVariant,
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () => EventsPage.show(context),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Events',
                      style: titleStyle,
                    ),
                    Text(
                      'Nehm an unseren Events teil und lerne uns kennen',
                      style: subtitleStyle,
                    ),
                    UnDraw(
                      width: 150,
                      height: 150,
                      illustration: UnDrawIllustration.events,
                      color: colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          OutlinedCard(
            borderColor: colorScheme.outlineVariant,
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () => ProjectsPage.show(context),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Projekte',
                      style: titleStyle,
                    ),
                    Text(
                      'Unsere Projekte sind vielfältig und spannend',
                      style: subtitleStyle,
                    ),
                    UnDraw(
                      width: 150,
                      height: 150,
                      illustration: UnDrawIllustration.scrum_board,
                      color: colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          OutlinedCard(
            borderColor: colorScheme.outlineVariant,
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () => KTPage.show(context),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Karlsruhe Transfer',
                      style: titleStyle,
                    ),
                    Text(
                      'Der Karlsruhe Transfer ist ein Magazin für Studierende',
                      style: subtitleStyle,
                    ),
                    UnDraw(
                      width: 150,
                      height: 150,
                      illustration: UnDrawIllustration.reading,
                      color: colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
