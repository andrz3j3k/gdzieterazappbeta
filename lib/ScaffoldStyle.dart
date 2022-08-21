import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var themeLight = ThemeData(
  textTheme: TextTheme(
    bodyText2: GoogleFonts.roboto(fontWeight: FontWeight.w500),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 232, 171, 66),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
  ),
);

bool whatIsDarkMode = false;

//light mode or dark mode
Color colorStylingApplication = whatIsDarkMode == false
    ? const Color.fromARGB(255, 232, 171, 66)
    : const Color.fromARGB(255, 31, 6, 160);
