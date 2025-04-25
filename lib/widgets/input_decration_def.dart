import 'package:flutter/material.dart';
import 'package:real_state/core/helper/context_extensions..dart';

import '../core/constants/colors.dart';
import '../core/constants/styles.dart';

InputDecoration inputDecorationDef(IconData icon, String label , BuildContext context) {
  final locale = Localizations.localeOf(context);
  final isDark = context.theme.state.isDark;
  return InputDecoration(
    suffixIcon: Icon(icon, color: AppColors.darkText),
    contentPadding: const EdgeInsets.only(
      bottom: 8,
      top: 8,
      left: 15,
      right: 15,
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),

    label: Text(
      label,
      style: AppFonts.body(locale, isDark: isDark),
    ),
  );
}
