import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/src/constants/colors.dart';

class TAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
        headline2: GoogleFonts.nunito(color: Colors.black87),
        headline3: GoogleFonts.nunito(
          color: tWhiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 28,
        ),
        headline4: GoogleFonts.nunito(
          color: tTextColor,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        )),
    primarySwatch: MaterialColor(0xFF702963, <int, Color>{
      50: Color(0x1A702963),
      100: Color(0x33702963),
      200: Color(0x4D702963),
      300: Color(0x66702963),
      400: Color(0x80702963),
      500: Color(0xFF702963),
      600: Color(0x99702963),
      700: Color(0xB3702963),
      800: Color(0xCC702963),
      900: Color(0xE6702963),
    }),
  );
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
