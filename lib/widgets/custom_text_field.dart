import 'package:flutter/material.dart';
import 'package:real_state/widgets/input_decration_def.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.paddingTop,
    this.icon,
    this.validator,
    this.keyboard,
    this.press,
  });
  final String label;
  final IconData? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double paddingTop;
  final TextInputType? keyboard;
  final void Function(String?)? press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controller,
        validator: validator,

        decoration: inputDecorationDef(icon ?? Icons.email_outlined, label, context),
        onSaved: (value) {
          controller.text = value!;
        },
        onChanged: press,
      ),
    );
  }
}
