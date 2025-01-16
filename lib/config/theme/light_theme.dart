import 'package:flutter/material.dart';
import 'package:kori_etu/config/theme/style.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: kscaffoldBackgroundColor,
  useMaterial3: true,
  brightness: Brightness.light,
  colorSchemeSeed: kprimary,
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
  iconTheme: const IconThemeData(
    color: kprimary,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.white,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
  ),
);
