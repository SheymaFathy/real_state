import 'package:flutter/material.dart';

import '../constants/colors.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backGround(context),
  primaryColor: AppColors.primary(context),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary(context),
    foregroundColor: AppColors.white(context),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      color: AppColors.titleColor(context),
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.titleColor(context),
    ),
  ),
);

ThemeData darkTheme(BuildContext context) => ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.backGround(context),
  primaryColor: AppColors.primary(context),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary(context),
    foregroundColor: AppColors.white(context),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      color: AppColors.white(context),
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.white(context),
    ),
  ),
);
