import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';
import '../../core/theme/theme_cubit.dart';
import '../../core/theme/theme_status.dart';

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
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        final backgroundColor = AppColors.primary(context);
        final shadowColor = AppColors.primary(context);

        return Padding(
          padding: EdgeInsets.only(top: padding ?? 0),
          child: ElevatedButton(
            onPressed: press,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(7),
              backgroundColor: backgroundColor,
              maximumSize: Size(MediaQuery.sizeOf(context).width, 40),
              minimumSize: Size(MediaQuery.sizeOf(context).width, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
            ).copyWith(
              shadowColor: WidgetStateProperty.all<Color>(shadowColor), // الظل بنفس لون الخلفية
            ),
            child: Text(text, style: AppTextStyles.btnText(context)),
          ),
        );
      },
    );
  }
}
