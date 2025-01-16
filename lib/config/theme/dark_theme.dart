import 'package:flutter/material.dart';
import 'package:kori_etu/config/theme/style.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorSchemeSeed: Colors.yellow,
  fontFamily: 'FamiljenGrotesk',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(kprimary),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return ksecondary.withOpacity(0.7);
          }
          return null;
        },
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      side: WidgetStateProperty.all<BorderSide>(
        const BorderSide(color: kprimary),
      ),
      foregroundColor: WidgetStateProperty.all<Color>(kprimary),
    ),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.white,
  ),
);
