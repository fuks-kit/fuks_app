import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const fuksColor = Color(0xffEB5E28);
const _seedColor = fuksColor;

final _colorsLight = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: _seedColor,
  background: Colors.white,
  onBackground: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
  surfaceTint: Colors.white,
  primary: fuksColor,
  outline: Colors.grey[700],
  outlineVariant: Colors.grey[400],
  secondary: fuksColor,
);

final _colorsDark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: _seedColor,
  primary: fuksColor,
  onPrimary: Colors.white,
  secondary: fuksColor,
  onSecondary: Colors.white,
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
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: _colorsLight.onBackground,
    ),
  ),
  listTileTheme: _listTileTheme,
  chipTheme: ChipThemeData(
    backgroundColor: _colorsLight.primaryContainer,
    iconTheme: IconThemeData(
      size: 16,
      color: _colorsLight.onPrimaryContainer,
    ),
    labelStyle: TextStyle(
      color: _colorsLight.onPrimaryContainer,
      fontWeight: FontWeight.w500,
    ),
    side: const BorderSide(
      style: BorderStyle.none,
    ),
  ),
  textTheme: GoogleFonts.montserratTextTheme(
    TextTheme(
      displayLarge: TextStyle(color: _colorsLight.onBackground),
      displayMedium: TextStyle(color: _colorsLight.onBackground),
      displaySmall: TextStyle(color: _colorsLight.onBackground),
      headlineLarge: TextStyle(color: _colorsLight.onBackground),
      headlineMedium: TextStyle(color: _colorsLight.onBackground),
      headlineSmall: TextStyle(color: _colorsLight.onBackground),
      titleLarge: TextStyle(
        color: _colorsLight.onBackground,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: _colorsLight.onBackground,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: _colorsLight.onBackground,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: _colorsLight.onBackground),
      bodyMedium: TextStyle(color: _colorsLight.onBackground),
      bodySmall: TextStyle(color: _colorsLight.onBackground),
      labelLarge: TextStyle(color: _colorsLight.onBackground),
      labelMedium: TextStyle(color: _colorsLight.onBackground),
      labelSmall: TextStyle(color: _colorsLight.onBackground),
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
    backgroundColor: _colorsDark.primaryContainer,
    iconTheme: IconThemeData(
      size: 16,
      color: _colorsDark.onPrimaryContainer,
    ),
    labelStyle: TextStyle(
      color: _colorsDark.onPrimaryContainer,
      fontWeight: FontWeight.w500,
    ),
    side: const BorderSide(
      style: BorderStyle.none,
    ),
  ),
  textTheme: GoogleFonts.montserratTextTheme(
    TextTheme(
      displayLarge: TextStyle(color: _colorsDark.onBackground),
      displayMedium: TextStyle(color: _colorsDark.onBackground),
      displaySmall: TextStyle(color: _colorsDark.onBackground),
      headlineLarge: TextStyle(color: _colorsDark.onBackground),
      headlineMedium: TextStyle(color: _colorsDark.onBackground),
      headlineSmall: TextStyle(color: _colorsDark.onBackground),
      titleLarge: TextStyle(
        color: _colorsDark.onBackground,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: _colorsDark.onBackground,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: _colorsDark.onBackground,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: _colorsDark.onBackground),
      bodyMedium: TextStyle(color: _colorsDark.onBackground),
      bodySmall: TextStyle(color: _colorsDark.onBackground),
      labelLarge: TextStyle(color: _colorsDark.onBackground),
      labelMedium: TextStyle(color: _colorsDark.onBackground),
      labelSmall: TextStyle(color: _colorsDark.onBackground),
    ),
  ),
);
