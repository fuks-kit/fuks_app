import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fuks_app/firebase_options.dart';
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
          SignInScreen.route,
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
      title: 'fuks App',
      themeMode: ThemeMode.system,
      theme: fuksThemeLight,
      darkTheme: fuksThemeDark,
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? SignInScreen.route
          : HomePage.route,
      routes: {
        HomePage.route: (context) => const HomePage(),
        SignInScreen.route: (context) => const SignInScreen(),
        SettingsPage.route: (context) => const SettingsPage(),
      },
    );
  }
}
