import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: SAColors.white,
    fontFamily: GoogleFonts.poppins().fontFamily);

class SAColors {
  static const Color primary = Color(0xFFC95372);
  static const Color secondary = Color(0xFF5185BF);
  static const Color black = Color(0xFF231515);
  static const Color white = Color(0xFFD6CACA);
  static const Color fontColor = Color(0xFF90A1B5);
  static const Color babyBlue = Color(0xFFBCC3CD);
  static const Color pink = Color(0xFFCE6C85);
}
