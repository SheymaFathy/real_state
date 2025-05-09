import 'package:flutter/material.dart';
import '../../../../../../core/constants/styles.dart';

class LabeledBox extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const LabeledBox({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.grey.shade700),
            const SizedBox(width: 8),
            Text(label, style: AppTextStyles.title(context)),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(value, style: AppTextStyles.title(context)),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
