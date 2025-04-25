import 'package:flutter/material.dart';
import 'package:real_state/core/helper/context_extensions..dart';
import '../core/constants/colors.dart';
import '../core/constants/styles.dart';

class ElevatedButtonDef extends StatelessWidget {
  const ElevatedButtonDef({
    super.key,
    required this.press,
    required this.text,
    this.padding,
  });
  final String text;
  final void Function() press;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isDark = context.theme.state.isDark;
    return Padding(
      padding: EdgeInsets.only(top: padding ?? 0),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: AppColors.primaryColor,
          maximumSize: Size(MediaQuery.sizeOf(context).width, 45),
          minimumSize: Size(MediaQuery.sizeOf(context).width, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
        ).copyWith(
          shadowColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
        ),
        child: Text(text, style: AppFonts.body(locale, isDark: isDark)),
      ),
    );
  }
}
