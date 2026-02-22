import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class AppTheme {
  static ThemeData getTheme(Locale? locale) {
    bool isArabic = locale?.languageCode == 'ar';
    
    // Choose base text theme
    TextTheme baseTheme = isArabic 
        ? GoogleFonts.tajawalTextTheme() 
        : GoogleFonts.outfitTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.emerald,
        primary: AppColors.emerald,
        secondary: AppColors.gold,
        surface: AppColors.background,
        background: AppColors.background,
      ),
      textTheme: baseTheme.copyWith(
        displayLarge: (isArabic ? GoogleFonts.tajawal() : GoogleFonts.outfit()).copyWith(
          color: AppColors.emerald,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: (isArabic ? GoogleFonts.tajawal() : GoogleFonts.outfit()).copyWith(
          color: AppColors.emerald,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: (isArabic ? GoogleFonts.tajawal() : GoogleFonts.outfit()).copyWith(
          color: AppColors.emerald,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.emerald,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.emerald,
          foregroundColor: Colors.white,
          textStyle: (isArabic ? GoogleFonts.tajawal() : GoogleFonts.outfit()).copyWith(
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static TextStyle get arabicStyle {
    return GoogleFonts.amiri(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.emerald,
    );
  }
}
