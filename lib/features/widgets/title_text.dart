import 'package:flutter/cupertino.dart';
import '../../core/constants/styles.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyles.title(context));
  }
}
