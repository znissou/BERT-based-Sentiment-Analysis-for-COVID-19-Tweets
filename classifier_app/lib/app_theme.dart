import 'package:flutter/material.dart';

class AppTheme {
  // Color scheme
  static const primaryColor = Color(0xFF6366F1); // Indigo
  static const secondaryColor = Color(0xFF8B5CF6); // Purple
  static const accentColor = Color(0xFF06B6D4); // Cyan
  static const successColor = Color(0xFF10B981); // Green
  static const errorColor = Color(0xFFEF4444); // Red
  static const warningColor = Color(0xFFF59E0B); // Amber

  static const backgroundColor = Color(0xFFF8FAFC);
  static const surfaceColor = Colors.white;
  static const textPrimaryColor = Color(0xFF1E293B);
  static const textSecondaryColor = Color(0xFF64748B);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColor,
      background: backgroundColor,
      error: errorColor,
    ),
    scaffoldBackgroundColor: backgroundColor,

    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: textPrimaryColor,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textPrimaryColor),
    ),

    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      contentPadding: const EdgeInsets.all(16),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: textPrimaryColor),
      displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textPrimaryColor),
      displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimaryColor),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: textPrimaryColor),
      bodyLarge: TextStyle(fontSize: 16, color: textPrimaryColor),
      bodyMedium: TextStyle(fontSize: 14, color: textSecondaryColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.dark, primary: primaryColor, secondary: secondaryColor),
  );
}
