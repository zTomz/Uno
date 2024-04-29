import 'package:flutter/material.dart';
import 'package:uno/core/config/material_theme.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: MaterialTheme.lightScheme().toColorScheme(),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: MaterialTheme.darkScheme().toColorScheme(),
  );
}
