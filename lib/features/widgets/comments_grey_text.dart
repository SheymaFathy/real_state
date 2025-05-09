import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/styles.dart';
import '../../core/theme/theme_cubit.dart';
import '../../core/theme/theme_status.dart';

class CommentGreyText extends StatelessWidget {
  final String text;

  const CommentGreyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return Text(text, style: AppTextStyles.subTitle(context));
      },
    );
  }
}
