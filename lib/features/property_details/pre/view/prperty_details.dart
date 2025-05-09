import 'package:flutter/material.dart';
import 'package:real_state/core/constants/styles.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Property Details",
          style: AppTextStyles.title(context),
      ),
      ),
    );
  }
}

