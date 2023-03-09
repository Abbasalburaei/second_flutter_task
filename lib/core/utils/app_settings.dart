import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppSettings {
  static Color get primaryColor => const Color(0xFFFEDE3F);
  static Color get secondaryColor => const Color(0xFF676767);
  static ThemeData get defaultTheme => ThemeData(
      fontFamily: GoogleFonts.tajawal().fontFamily,
      colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          secondary: primaryColor,
          tertiary: secondaryColor),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.tajawal(
              color: secondaryColor, fontWeight: FontWeight.bold)),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle:
              TextStyle(color: const Color(0xFF242424), fontSize: 24.sp),
          iconTheme: IconThemeData(size: 24, color: primaryColor)));
}
