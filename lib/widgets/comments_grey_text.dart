import 'package:flutter/cupertino.dart';
import 'package:real_state/core/helper/context_extensions..dart';

import '../core/constants/styles.dart';

class CommentGreyText extends StatelessWidget {
  final String text;
  const CommentGreyText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isDark = context.theme.state.isDark;
    return Text(text,
        style: AppFonts.subTitle(locale, isDark: isDark),);

  }
}