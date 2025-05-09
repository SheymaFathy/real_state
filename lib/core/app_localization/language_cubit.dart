import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(Locale systemLocale) : super(LanguageState(systemLocale));

  void changeLanguage(String code) {
    emit(LanguageState(Locale(code)));
  }
}
