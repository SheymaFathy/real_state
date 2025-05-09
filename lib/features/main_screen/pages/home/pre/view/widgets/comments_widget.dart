import 'package:flutter/material.dart';
import 'package:real_state/core/constants/styles.dart';

import '../../../../../../../core/shared_preferences/cach_helper.dart';

class CommentsWidget extends StatelessWidget {
  final List<String> comments;

  const CommentsWidget({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    final String? username = CacheHelper.getSaveData(key: 'username') as String?;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(username!, style: AppTextStyles.title(context),),
          subtitle: Text(comments[index], style: AppTextStyles.body(context),),
        );
      },
    );
  }
}
