import 'package:flutter/material.dart';

import '../../../../../../../core/constants/styles.dart';

class LocationInput extends StatelessWidget {
  const LocationInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 5),
          child: Text("Location", style: AppTextStyles.body(context)),
        ),
      ],
    );
  }
}
