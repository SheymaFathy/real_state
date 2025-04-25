
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_state/core/app_localization/app_localization.dart';
import '../../../../../../../widgets/comments_grey_text.dart';
import '../../../../../../../widgets/title_text.dart';

class HomeTextPart extends StatelessWidget {
  const HomeTextPart({super.key});
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           TitleText(title: local.translate("home_title_1"),),
           TitleText(title: local.translate("home_title_2")),
          const SizedBox(height: 6),
           CommentGreyText(text: local.translate("home_title_grey"),),
        ],
      ),
    );
  }
}




