import 'package:flutter/cupertino.dart';
import 'package:real_state/core/helper/context_extensions..dart';

import '../core/constants/styles.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isDark = context.theme.state.isDark;
    return Text(title, style:AppFonts.title(locale, isDark: isDark),);
  }
}