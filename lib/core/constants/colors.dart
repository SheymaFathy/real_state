import 'package:flutter/material.dart';
import 'package:real_state/core/helper/context_extensions.dart';

class AppColors {
  static const Color _primaryLight = Color(0xFF4199C3);
  static const Color _primaryDark = Color.fromRGBO(21, 54, 74, 0.945);

  static const Color _lightGrey = Color(0xFFFFFFFF);
  static const Color _darkGrey = Color(0xFFCBCBCB);

  static const Color _white = Color(0xFFFFFFFF);
  static const Color _black = Color(0xFF000000);

  static const Color _darkText = Color(0xFF15364A);
  static const Color _hintText = Color(0xFF5B5B5B);
  static const Color _textFieldFill = Color(0xFFE4E4E4);


  static Color primary(BuildContext context) =>
      context.isDark ? _primaryDark : _primaryLight;

  static Color backGround(BuildContext context) =>
      context.isDark ? _darkGrey : _lightGrey;

  static Color titleColor(BuildContext context) => _darkText;
  static Color textHintColor(BuildContext context) => _hintText;
  static Color textFieldColor(BuildContext context) => _textFieldFill;
  static Color btnText(BuildContext context) => context.isDark
      ? _white
      : _darkText;
  static Color white(BuildContext context) => _white;

  static Color black(BuildContext context) => _black;
  static Color toggleBtn (BuildContext context) => context.isDark
      ? _primaryLight
      : _darkText;
}
