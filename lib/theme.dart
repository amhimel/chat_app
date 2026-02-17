import 'package:flutter/material.dart';

class ChatTheme {
  // ================= LIGHT THEME =================
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF2563EB),
      onPrimary: Colors.white,
      secondary: Color(0xFFB6B6B6),
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    textTheme: const TextTheme(
      // Display
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.bold,
      ),

      // Headline
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),

      // Title
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),

      // Body
      bodyLarge: TextStyle(fontSize: 16),

      bodyMedium: TextStyle(fontSize: 14),

      // Label
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    ),

    scaffoldBackgroundColor: const Color(0xFFF9FAFB),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2563EB),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade200,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          if (states.contains(WidgetState.pressed)) {
            return const Color(0xFF1D4ED8);
          }
          return const Color(0xFF2563EB);
        }),
        overlayColor: WidgetStateProperty.all(
          const Color(0xFF2563EB).withOpacity(0.1),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    ),
  );

  // ================= DARK THEME =================
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF3B82F6),
      onPrimary: Colors.white,
      secondary: Color(0xFF10B981),
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Color(0xFF111827),
      onBackground: Colors.white,
      surface: Color(0xFF1F2937),
      onSurface: Colors.white,
    ),
    textTheme: const TextTheme(
      // Display
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),

      // Headline
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),

      // Title
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),

      // Body
      bodyLarge: TextStyle(fontSize: 16),

      bodyMedium: TextStyle(fontSize: 14),

      // Label
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    ),
    scaffoldBackgroundColor: const Color(0xFF111827),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F2937),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade800,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3B82F6),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          if (states.contains(MaterialState.pressed)) {
            return const Color(0xFF1D4ED8);
          }
          return const Color(0xFF2563EB);
        }),
        overlayColor: MaterialStateProperty.all(
          const Color(0xFF2563EB).withOpacity(0.1),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ),
  );
}
