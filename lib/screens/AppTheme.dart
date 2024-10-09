import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor =
      Color(0xFFFF5508); // Orange color from the image

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: MaterialColor(primaryColor.value, {
        50: primaryColor.withOpacity(0.1),
        100: primaryColor.withOpacity(0.2),
        200: primaryColor.withOpacity(0.3),
        300: primaryColor.withOpacity(0.4),
        400: primaryColor.withOpacity(0.5),
        500: primaryColor,
        600: primaryColor.withOpacity(0.6),
        700: primaryColor.withOpacity(0.7),
        800: primaryColor.withOpacity(0.8),
        900: primaryColor.withOpacity(0.9),
      }),
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
