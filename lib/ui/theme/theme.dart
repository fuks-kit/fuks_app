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
);

final _colorsDark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: _seedColor,
);

const _listTileTheme = ListTileThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
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
  listTileTheme: _listTileTheme,
  chipTheme: ChipThemeData(
    backgroundColor: _colorsLight.surfaceVariant,
    iconTheme: IconThemeData(
      size: 16,
      color: _colorsLight.onSurfaceVariant,
    ),
    labelStyle: TextStyle(
      color: _colorsLight.onSurfaceVariant,
      fontWeight: FontWeight.w500,
    ),
    side: const BorderSide(
      style: BorderStyle.none,
    ),
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
  listTileTheme: _listTileTheme,
  chipTheme: ChipThemeData(
    backgroundColor: _colorsDark.surfaceVariant,
    iconTheme: IconThemeData(
      size: 16,
      color: _colorsDark.onSurfaceVariant,
    ),
    labelStyle: TextStyle(
      color: _colorsDark.onSurfaceVariant,
      fontWeight: FontWeight.w500,
    ),
    side: const BorderSide(
      style: BorderStyle.none,
    ),
  ),
);
