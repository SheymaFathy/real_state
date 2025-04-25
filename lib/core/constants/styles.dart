import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppFonts {
  static TextStyle headline(Locale locale, {required bool isDark}) {
    return _getFont(locale).copyWith(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: isDark ? Colors.white : AppColors.darkText,
    );
  }

  static TextStyle title(Locale locale, {required bool isDark}) {
    return _getFont(locale).copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: isDark ? Colors.white70 : AppColors.darkText,
    );
  }

  static TextStyle subTitle(Locale locale, {required bool isDark}) {
    return _getFont(locale).copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: isDark ? Colors.grey[400] : AppColors.darkPrimary,
    );
  }

  static TextStyle body(Locale locale, {required bool isDark}) {
    return _getFont(locale).copyWith(
      fontSize: 14,
      color: isDark ? Colors.white : AppColors.darkText,
    );
  }

  static TextStyle _getFont(Locale locale) {
    return locale.languageCode == 'ar'
        ? GoogleFonts.cairo()
        : GoogleFonts.poppins();
  }
}
