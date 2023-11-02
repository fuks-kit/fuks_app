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
  surfaceVariant: Colors.grey[200],
  onSurfaceVariant: Colors.grey[800],
);

final _colorsDark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: _seedColor,
  background: Colors.grey[900],
  onBackground: Colors.white,
  surface: Colors.grey[900],
  onSurface: Colors.white,
  surfaceTint: Colors.black,
  primary: fuksColor,
  outline: Colors.grey[600],
  outlineVariant: Colors.grey[800],
  secondary: fuksColor,
  surfaceVariant: Colors.grey[800],
  onSurfaceVariant: Colors.grey[200],
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
  textTheme: TextTheme(
    displayLarge: GoogleFonts.raleway(color: _colorsLight.onBackground),
    displayMedium: GoogleFonts.raleway(color: _colorsLight.onBackground),
    displaySmall: GoogleFonts.raleway(color: _colorsLight.onBackground),
    headlineLarge: GoogleFonts.raleway(color: _colorsLight.onBackground),
    headlineMedium: GoogleFonts.raleway(color: _colorsLight.onBackground),
    headlineSmall: GoogleFonts.raleway(color: _colorsLight.onBackground),
    titleLarge: GoogleFonts.raleway(
      color: _colorsLight.onBackground,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.raleway(
      color: _colorsLight.onBackground,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: GoogleFonts.raleway(
      color: _colorsLight.onBackground,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: GoogleFonts.sourceSans3(color: _colorsLight.onBackground),
    bodyMedium: GoogleFonts.sourceSans3(color: _colorsLight.onBackground),
    bodySmall: GoogleFonts.sourceSans3(color: _colorsLight.onBackground),
    labelLarge: GoogleFonts.raleway(
      color: _colorsLight.onBackground,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: GoogleFonts.raleway(
      color: _colorsLight.onBackground,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: GoogleFonts.raleway(
      color: _colorsLight.onBackground,
      fontWeight: FontWeight.w600,
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    iconTheme: MaterialStateProperty.all(IconThemeData(
      color: _colorsLight.onSurface,
    )),
    indicatorColor: _colorsLight.outlineVariant.withOpacity(0.5),
    // indicatorColor: _colorsDark.primary,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: _colorsLight.onSurface,
    ),
  ),
  iconTheme: IconThemeData(
    color: _colorsLight.onSurface,
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
  textTheme: TextTheme(
    displayLarge: GoogleFonts.raleway(color: _colorsDark.onBackground),
    displayMedium: GoogleFonts.raleway(color: _colorsDark.onBackground),
    displaySmall: GoogleFonts.raleway(color: _colorsDark.onBackground),
    headlineLarge: GoogleFonts.raleway(color: _colorsDark.onBackground),
    headlineMedium: GoogleFonts.raleway(color: _colorsDark.onBackground),
    headlineSmall: GoogleFonts.raleway(color: _colorsDark.onBackground),
    titleLarge: GoogleFonts.raleway(
      color: _colorsDark.onBackground,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.raleway(
      color: _colorsDark.onBackground,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: GoogleFonts.raleway(
      color: _colorsDark.onBackground,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: GoogleFonts.sourceSans3(color: _colorsDark.onBackground),
    bodyMedium: GoogleFonts.sourceSans3(color: _colorsDark.onBackground),
    bodySmall: GoogleFonts.sourceSans3(color: _colorsDark.onBackground),
    labelLarge: GoogleFonts.raleway(
      color: _colorsDark.onBackground,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: GoogleFonts.raleway(
      color: _colorsDark.onBackground,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: GoogleFonts.raleway(
      color: _colorsDark.onBackground,
      fontWeight: FontWeight.w600,
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    iconTheme: MaterialStateProperty.all(IconThemeData(
      color: _colorsDark.onSurface,
    )),
    indicatorColor: _colorsDark.outlineVariant.withOpacity(0.5),
    // indicatorColor: _colorsDark.primary,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: _colorsDark.onSurface,
    ),
  ),
  iconTheme: IconThemeData(
    color: _colorsDark.onSurface,
  ),
);
