import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/theme/theme_status.dart';

import '../shared_preferences/cach_helper.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.light)) {
    loadTheme();
  }

  void toggleTheme() {
    final newTheme = state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(ThemeState(themeMode: newTheme));
    CacheHelper.saveData(
      key: 'themeMode',
      value: newTheme == ThemeMode.dark,
    );
  }

  void loadTheme() {
    final isDark = CacheHelper.getData(key: 'themeMode') ?? false;
    emit(ThemeState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }
}

