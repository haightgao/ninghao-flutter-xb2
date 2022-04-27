import 'package:flutter/material.dart';

/// 应用主题
class AppTheme {
  static ThemeData light = ThemeData(
    primaryColor: Colors.deepPurpleAccent,
    colorScheme: const ColorScheme.light(
      primary: Colors.deepPurpleAccent,
      secondary: Colors.amber,
    ),
  );

  static ThemeData dark = ThemeData(
    primaryColor: Colors.deepPurpleAccent,
    colorScheme: const ColorScheme.dark(
      primary: Colors.deepPurpleAccent,
      secondary: Colors.amber,
    ),
  );
}
