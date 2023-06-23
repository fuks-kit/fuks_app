import 'package:flutter/material.dart';
import 'package:fuks_app/ui/pages/home/home_page.dart';
import 'package:fuks_app/ui/theme/theme.dart';

void main() {
  runApp(const FuksApp());
}

class FuksApp extends StatelessWidget {
  const FuksApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fuks',
      theme: fuksThemeLight,
      darkTheme: fuksThemeDark,
      home: const HomePage(),
    );
  }
}
