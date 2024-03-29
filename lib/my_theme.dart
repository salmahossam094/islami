import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color lightColor = const Color(0xFFB7935F);
  static Color darkColorIcon = const Color(0xFFFACC1D);
  static Color darkColor = const Color(0xFF141A2E);

  static ThemeData lightTheme = ThemeData(
      primaryColor: lightColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30.sp,
        ),
        // ignore: prefer_const_constructors
        bodyMedium: GoogleFonts.jomhuria(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 25.sp,
        ),
        bodySmall: GoogleFonts.elMessiri(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 25.sp,
        ),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightColor,
        selectedItemColor: Colors.black,
        selectedLabelStyle:  GoogleFonts.elMessiri(color: Colors.black, fontSize: 18.sp,fontWeight: FontWeight.w600),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle:
            GoogleFonts.elMessiri(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w600),
      ));
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkColor,
        selectedItemColor: darkColorIcon,
        selectedLabelStyle:
             TextStyle(color: const Color(0xFFFACC1D), fontSize: 18.sp,fontWeight: FontWeight.w600),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle:  TextStyle( fontSize: 18.sp,fontWeight: FontWeight.w600),
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.sp,
        ),
        bodyMedium: GoogleFonts.jomhuria(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 25.sp,
        ),
        bodySmall: GoogleFonts.elMessiri(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 25.sp,
        ),
      ));
}
