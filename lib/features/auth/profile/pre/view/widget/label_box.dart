import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/theme/theme_cubit.dart';

class LabeledBox extends StatelessWidget {
  final String label;
  final String value;

  const LabeledBox({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    final isDark = context.read<ThemeCubit>().state == ThemeMode.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.person, color: Colors.grey.shade700),
            const SizedBox(width: 8),
            Text(label, style: AppFonts.title(locale, isDark: isDark)),
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
          child: Text(value),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
