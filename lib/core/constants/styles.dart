import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_state/core/constants/colors.dart';


class AppTextStyles {
  static TextStyle headline(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return _getFont(locale).copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.titleColor(context),
    );
  }

  static TextStyle title(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return _getFont(locale).copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.titleColor(context),
    );
  }

  static TextStyle subTitle(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return _getFont(locale).copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: AppColors.titleColor(context),
    );
  }

  static TextStyle body(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return _getFont(locale).copyWith(
      fontSize: 14,
      color: AppColors.titleColor(context),
    );
  }

  static TextStyle btnText(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return _getFont(locale).copyWith(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: AppColors.btnText(context),
    );
  }

  static TextStyle _getFont(Locale locale) {
    return locale.languageCode == 'ar'
        ? GoogleFonts.cairo()
        : GoogleFonts.poppins();
  }

  static TextStyle cartText(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return _getFont(locale).copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.white(context),
    );
  }
}