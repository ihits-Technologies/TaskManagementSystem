import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.rubik(color: Colors.black87),
    displayMedium: GoogleFonts.rubik(color: Colors.black87),
    displaySmall: GoogleFonts.rubik(color: Colors.black87),
    headlineMedium: GoogleFonts.rubik(color: Colors.black87),
    headlineSmall: GoogleFonts.rubik(color: Colors.black87),
    titleLarge: GoogleFonts.rubik(color: Colors.black87),
    bodyLarge: GoogleFonts.rubik(color: Colors.black87),
    bodyMedium: GoogleFonts.rubik(color: Colors.black87),
    bodySmall: GoogleFonts.rubik(color: Colors.black87),
    titleSmall: GoogleFonts.rubik(color: Colors.black87, fontSize: 24),

  );
  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(color: Colors.white70),
    titleSmall: GoogleFonts.poppins(color: Colors.white60, fontSize: 24),
  );
}

/*

Headline 1 – DisplayLarge
Headline 2 – DisplayMedium
Headline 3 – DisplaySmall
Headline 4 – HeadlineMedium
Headline 5 – HeadlineSmall
Headline 6 – TitleLarge
Body Text 1 – BodyLarge
Body Text 2 – BodyMedium
Caption – BodySmall

 */
