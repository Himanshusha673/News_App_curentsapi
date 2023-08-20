import 'package:flutter/material.dart';

class AppColors {
  static const Color blackColor = Color(0xFF00000);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static const Color buttonColor = Colors.green;
}

// Define your dark theme
final darkTheme = ThemeData.dark().copyWith(
  // Customize dark theme properties here
  primaryColor: Colors.black,
  accentColor: Colors.blueAccent,
  // ... other theme properties
);

// Define your light theme
final lightTheme = ThemeData.light().copyWith(
  // Customize light theme properties here
  primaryColor: Colors.blue,
  accentColor: Colors.orangeAccent,
  // ... other theme properties
);
