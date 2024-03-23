import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade200,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade400,
  ),
  textTheme: GoogleFonts.josefinSansTextTheme().copyWith().apply(
        bodyColor: Colors.grey.shade900,
        displayColor: Colors.grey.shade900,
      ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
  textTheme: GoogleFonts.josefinSansTextTheme().copyWith().apply(
        bodyColor: Colors.grey.shade200,
        displayColor: Colors.grey.shade200,
      ),
);
