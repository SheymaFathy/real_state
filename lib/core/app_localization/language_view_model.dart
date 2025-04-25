
import 'language_cubit.dart';

class LanguageViewModel {
  final LanguageCubit languageCubit;

  LanguageViewModel(this.languageCubit);

  void switchToArabic() => languageCubit.changeLanguage('ar');
  void switchToEnglish() => languageCubit.changeLanguage('en');
}
