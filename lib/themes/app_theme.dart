import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Font families
  static String get fontFamily => GoogleFonts.poppins().fontFamily!;

  // Text Styles
  static TextStyle get headingLarge => GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      );

  static TextStyle get headingMedium => GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      );

  static TextStyle get bodyLarge => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      );

  static TextStyle get bodyMedium => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      );

  static TextStyle get buttonText => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );

  static TextStyle get linkText => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF9C27B0),
      );

  // Colors
  static const Color primaryColor = Color(0xFF9C27B0);
  static const Color primaryLight = Color(0xFFD8B5F5);

  // Theme Data
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: fontFamily,
        textTheme: GoogleFonts.poppinsTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      );
}
