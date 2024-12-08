import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryColor = Color(0xFF6C63FF);
  static final Color secondaryColor = Color(0xFFAB47BC);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 14, color: Colors.black54),
    ),
  );
}
