import 'package:flutter/material.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Property Details",
          style: Theme.of(context).textTheme.headlineMedium,
      ),
      ),
    );
  }
}
