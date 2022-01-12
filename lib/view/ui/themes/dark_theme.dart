import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/view/view_constants.dart';

ThemeData kDarkThemeData = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.white10,
  primaryColor: kPrimaryColor,
  textTheme: TextTheme(
    headline1: GoogleFonts.montserrat(
      color: Colors.black,
      fontSize: 32,
    ),
    headline2: GoogleFonts.montserrat(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    headline3: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 20),
    headline4: GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
    headline5: GoogleFonts.montserrat(color: Colors.grey.shade400, fontSize: 14),
    headline6: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedLabelStyle: GoogleFonts.montserrat(color: kPrimaryColor, fontSize: 18),
    unselectedLabelStyle: GoogleFonts.montserrat(color: kPrimaryColor, fontSize: 18),
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: Colors.grey,
  ),
);
