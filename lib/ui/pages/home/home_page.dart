import 'package:flutter/material.dart';
import 'package:fuks_app/ui/pages/home/events_body.dart';
import 'package:fuks_app/ui/pages/home/kt_body.dart';
import 'package:fuks_app/ui/pages/home/projects_body.dart';
import 'package:fuks_app/ui/pages/office/office_page.dart';
import 'package:fuks_app/ui/pages/settings/settings_page.dart';
import 'package:fuks_app/ui/widgets/fuks_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = 'home';

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const FuksLogo(),
        ),
        drawer: NavigationDrawer(
          selectedIndex: _index,
          onDestinationSelected: (index) {
            if (index < 3) {
              setState(() => _index = index);
              Navigator.of(context).pop();
            }

            if (index == 3) {
              OfficePage.show(context);
            }

            if (index == 4) {
              SettingsPage.show(context);
            }
          },
          children: const [
            DrawerHeader(
              child: Center(
                child: FuksIcon(
                  size: 80,
                ),
              ),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.event_outlined),
              selectedIcon: Icon(Icons.event),
              label: Text('Events'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.work_outline),
              selectedIcon: Icon(Icons.work),
              label: Text('Projekte'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.newspaper_outlined),
              selectedIcon: Icon(Icons.newspaper),
              label: Text('Karlsruhe Transfer'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.key_outlined),
              selectedIcon: Icon(Icons.key),
              label: Text('Büro Zugang'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
          ],
        ),
        body: IndexedStack(
          index: _index,
          children: const [
            EventsBody(),
            ProjectsBody(),
            KTBody(),
          ],
        ),
      ),
    );
  }
}
