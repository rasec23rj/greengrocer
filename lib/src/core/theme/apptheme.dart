import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,

    primaryColor: const Color(0xFF8BC34A),
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF8BC34A),
      secondary: const Color(0xFF64B5F6),
    ),
    scaffoldBackgroundColor: Colors.white.withAlpha(190),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white.withAlpha(190),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8BC34A),
        textStyle: TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        // Use WidgetStateProperty.all for properties that should apply
        // to all states.
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        ),
        foregroundColor: WidgetStateProperty.all(const Color(0xFF8BC34A)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.green),
          ),
        ),
        // You can also define specific state behaviors here.
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return BorderSide(color: Colors.lightGreen); // Color when pressed
          }
          return BorderSide(color: Colors.green); // Default color
        }),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF8BC34A),
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      backgroundColor: Color(0xFF8BC34A),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // --- Border Styling ---
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          color: Colors.lightGreen,
        ), // Color when the field is enabled
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          color: Colors.green,
          width: 2.0,
        ), // Color and thickness when focused
      ),

      // --- Label and Helper Text Styling ---
      labelStyle: TextStyle(color: Colors.black),
      floatingLabelStyle: TextStyle(color: Colors.lightGreen),
      hintStyle: TextStyle(color: Colors.grey),

      // --- Content and Icon Styling ---
      contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
    ),
  );
}
