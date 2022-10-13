import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

var themeLight = ThemeData(
  textTheme: TextTheme(
    bodyText2: GoogleFonts.roboto(fontWeight: FontWeight.w500),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('E8AA42'), //zółty
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
  ),
  primaryColor: HexColor('E8AA42'), //zółty
);

var themeDark = ThemeData(
  textTheme: TextTheme(
    bodyText2: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      color: HexColor('D0D0D0'), //szary
    ),
  ),
  primaryColor: HexColor('373590'), //granatowy
  scaffoldBackgroundColor: HexColor('303030'), //jasnoczarny
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('373590'), //granatowy
    selectedItemColor: HexColor('D0D0D0'), //szary
    unselectedItemColor: HexColor('D0D0D0'), //szary
  ),
  listTileTheme: ListTileThemeData(
    textColor: universalColor,
  ),
);
//text colors
Color darkColorText = HexColor('D0D0D0'); //szary
Color lightColorText = Colors.white;
Color lightColorTextGrey = ColorToHex(Colors.black54); //czarnyjasny
Color universalColor = HexColor('F6F6F6'); //bialy
Color textBlack = HexColor('555555'); //szary po srodku czerni
Color textBlack2 = HexColor('787878'); //podobny do powyzszej szarosci

//title text color
Color titleTextColor = HexColor('5D5BBA');

//buttonStyle dark
Color backgroundColorButtonDark = HexColor('555555'); //szary po srodku czerni

//dropDownButton dark mode
Color darkColorDropDownButton = HexColor('414141');
//switch between dark and light mode

late bool whatIsDarkMode;

//light mode or dark mode
Color colorStylingApplication =
    whatIsDarkMode == false ? HexColor('E8AA42') : HexColor('373590');
