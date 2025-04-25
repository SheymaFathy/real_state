import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'theme_status.dart';  // تأكد من استيراد ThemeState

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light));

  void toggleTheme(bool isDark) {
    emit(ThemeState(
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
    ));
  }
}
