import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';

InputDecoration inputDecorationDef(
  IconData icon,
  String label,
  BuildContext context,
) {
  return InputDecoration(
    suffixIcon: Icon(icon, color: AppColors.primary(context)),
    contentPadding: const EdgeInsets.only(
      bottom: 8,
      top: 8,
      left: 15,
      right: 15,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary(context), width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary(context), width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color:AppColors.primary(context), width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),

    label: Text(label, style: AppTextStyles.body(context)),
  );
}