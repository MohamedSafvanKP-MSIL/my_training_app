import 'package:flutter/material.dart';

import 'font_styles.dart';

class AppTheme {
  static final family = FontStyles.roboto.fontFamily;

  // Light Theme
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: family),
        displayMedium: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: family),
        displaySmall: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: family),
        bodyLarge:
            TextStyle(color: Colors.black87, fontSize: 16, fontFamily: family),
        bodyMedium:
            TextStyle(color: Colors.black54, fontSize: 12, fontFamily: family),
        bodySmall:
        TextStyle(color: Colors.black54, fontSize: 10, fontFamily: family),
      ),
      disabledColor: Colors.grey,
      primaryColor: Colors.redAccent,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      canvasColor: Colors.black12,
      cardTheme: const CardTheme(color: Colors.white ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      useMaterial3: true);

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: family),
        displayMedium: TextStyle(
            color: Colors.white70,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: family),
        displaySmall: TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: family),
        bodyLarge:
            TextStyle(color: Colors.white70, fontSize: 16, fontFamily: family),
        bodyMedium:
            TextStyle(color: Colors.white60, fontSize: 12, fontFamily: family),
        bodySmall:
        TextStyle(color: Colors.white60, fontSize: 10, fontFamily: family),
      ),
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      disabledColor: Colors.grey,
      canvasColor: Colors.black26,
      cardColor: Colors.black,
      cardTheme: const CardTheme(color: Colors.black ),
      useMaterial3: true);
}
