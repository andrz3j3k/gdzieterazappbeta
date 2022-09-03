import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travelon/Providers/ChangeTheme.dart';

var themeLight = ThemeData(
  textTheme: TextTheme(
    bodyText2: GoogleFonts.roboto(fontWeight: FontWeight.w500),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('E8AA42'),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
  ),
  primaryColor: HexColor('E8AA42'),
);

var themeDark = ThemeData(
  textTheme: TextTheme(
    bodyText2: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      color: HexColor('D0D0D0'),
    ),
  ),
  primaryColor: HexColor('373590'),
  scaffoldBackgroundColor: HexColor('303030'),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('373590'),
    selectedItemColor: HexColor('D0D0D0'),
    unselectedItemColor: HexColor('D0D0D0'),
  ),
  listTileTheme: ListTileThemeData(
    textColor: universalColor,
  ),
);
//text colors
Color darkColorText = HexColor('D0D0D0');
Color lightColorText = Colors.white;
Color lightColorTextGrey = ColorToHex(Colors.black54);
Color universalColor = HexColor('F6F6F6');
Color textBlack = HexColor('555555');
Color textBlack2 = HexColor('787878');

//title text color
Color titleTextColor = HexColor('5D5BBA');

//buttonStyle dark
Color backgroundColorButtonDark = HexColor('555555');

//dropDownButton dark mode
Color darkColorDropDownButton = HexColor('414141');
//switch between dark and light mode

late bool whatIsDarkMode;

//light mode or dark mode
Color colorStylingApplication =
    whatIsDarkMode == false ? HexColor('E8AA42') : HexColor('373590');
