import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_localization/app_localization.dart';
import '../app_localization/language_cubit.dart';
import '../theme/theme_cubit.dart';

extension AppContextExtensions on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
  LanguageCubit get lang => read<LanguageCubit>();
  ThemeCubit get theme => read<ThemeCubit>();
}
