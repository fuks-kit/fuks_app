import 'package:flutter/material.dart';

const fuksColor = Color(0xffEB5E28);
// const _seedColor = fuksColor;
const _seedColor = Colors.blue;
// const _seedColor = Colors.green;

final _colorsLight = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: _seedColor,
  background: Colors.white,
  onBackground: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
  surfaceTint: Colors.white,
  // secondary: const Color(0xFF4CAF50),
  // onSecondary: const Color(0xFF2C2C2C),
);

final _colorsDark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: _seedColor,
);

final fuksThemeLight = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: _colorsLight,
  appBarTheme: AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 2,
    shadowColor: _colorsLight.onSurface,
    // centerTitle: false,
    // titleTextStyle: TextStyle(
    //   fontWeight: FontWeight.w500,
    //   color: _colorsLight.onSurface,
    //   // fontSize: 20,
    // ),
  ),
);

final fuksThemeDark = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: _colorsDark,
);
