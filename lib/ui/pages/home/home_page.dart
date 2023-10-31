import 'package:flutter/material.dart';
import 'package:fuks_app/ui/pages/events/events_page.dart';
import 'package:fuks_app/ui/pages/kt/kt_page.dart';
import 'package:fuks_app/ui/pages/projects/projects_body.dart';
import 'package:fuks_app/ui/pages/office/office_page.dart';
import 'package:fuks_app/ui/pages/settings/settings_page.dart';
import 'package:fuks_app/ui/widgets/fuks_logo.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = 'home';

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const _destinations = [
    NavigationDestination(
      icon: Icon(Icons.calendar_month_outlined),
      selectedIcon: Icon(Icons.calendar_month),
      label: 'Events',
    ),
    NavigationDestination(
      icon: Icon(Icons.lightbulb_outline),
      selectedIcon: Icon(Icons.lightbulb),
      label: 'Projekte',
    ),
    NavigationDestination(
      icon: Icon(Icons.newspaper_outlined),
      selectedIcon: Icon(Icons.newspaper),
      label: 'Karlsruher Transfer',
    ),
    NavigationDestination(
      icon: Icon(Icons.key_outlined),
      selectedIcon: Icon(Icons.key),
      label: 'Büro',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _destinations[_selectedIndex].label,
          style: const TextStyle(fontSize: 20),
        ),
        leading: IconButton(
          icon: const FuksIcon(),
          tooltip: 'fuks',
          onPressed: () => launchUrlString('https://fuks.org'),
        ),
        // title: const FuksLogo(),
        // centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Einstellungen',
            onPressed: () => SettingsPage.show(context),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1),
          NavigationBar(
            elevation: 2,
            selectedIndex: _selectedIndex,
            height: 56,
            indicatorColor: colorScheme.outlineVariant,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (index) =>
                setState(() => _selectedIndex = index),
            destinations: _destinations,
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          EventsBody(),
          ProjectsBody(),
          KTBody(),
          OfficeBody(),
        ],
      ),
    );
  }
}
