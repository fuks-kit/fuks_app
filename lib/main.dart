import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fuks_app/firebase_options.dart';
import 'package:fuks_app/ui/pages/event/event_page.dart';
import 'package:fuks_app/ui/pages/events/events_page.dart';
import 'package:fuks_app/ui/pages/kt/kt_page.dart';
import 'package:fuks_app/ui/pages/projects/projects_body.dart';
import 'package:fuks_app/ui/pages/office/office_page.dart';
import 'package:fuks_app/ui/pages/project/project_page.dart';
import 'package:fuks_app/ui/pages/home/home_page.dart';
import 'package:fuks_app/ui/pages/settings/settings_page.dart';
import 'package:fuks_app/ui/pages/sign_in/sign_in_page.dart';
import 'package:fuks_app/ui/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const FuksApp());
}

class FuksApp extends StatefulWidget {
  const FuksApp({super.key});

  @override
  State createState() => _FuksAppState();
}

class _FuksAppState extends State<FuksApp> {
  final _navigator = GlobalKey<NavigatorState>();

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      debugPrint("authStateChanges: ${user?.uid}");

      if (user == null) {
        _navigator.currentState?.pushNamedAndRemoveUntil(
          SignInPage.route,
          (_) => false,
        );
      } else {
        _navigator.currentState?.pushNamedAndRemoveUntil(
          HomePage.route,
          (_) => false,
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigator,
      title: 'fuks',
      themeMode: ThemeMode.system,
      theme: fuksThemeLight,
      darkTheme: fuksThemeDark,
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? SignInPage.route
          : HomePage.route,
      routes: {
        OfficePage.route: (context) => const OfficePage(),
        SignInPage.route: (context) => const SignInPage(),
        SettingsPage.route: (context) => const SettingsPage(),
        HomePage.route: (context) => const HomePage(),
        EventsPage.route: (context) => const EventsPage(),
        EventPage.route: (context) => const EventPage(),
        ProjectPage.route: (context) => const ProjectPage(),
        ProjectsPage.route: (context) => const ProjectsPage(),
        KTPage.route: (context) => const KTPage(),
      },
    );
  }
}
