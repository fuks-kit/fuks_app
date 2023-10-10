import 'package:flutter/material.dart';

const fuksColor = Color(0xffEB5E28);
const _seedColor = Colors.blue;

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
    shadowColor: _colorsLight.shadow,
  ),
);

final fuksThemeDark = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: _colorsDark,
  appBarTheme: AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 2,
    shadowColor: _colorsLight.shadow,
  ),
);
