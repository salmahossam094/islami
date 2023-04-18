import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color lightColor = const Color(0xFFB7935F);
  static ThemeData lightTheme = ThemeData(
      primaryColor: lightColor,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        // ignore: prefer_const_constructors
        bodyMedium: GoogleFonts.jomhuria(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 25,
        ),
        bodySmall: GoogleFonts.elMessiri(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 25,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightColor,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 12),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle:
            const TextStyle(color: Colors.white, fontSize: 12),
      ));
  static ThemeData darkTheme = ThemeData();
}
