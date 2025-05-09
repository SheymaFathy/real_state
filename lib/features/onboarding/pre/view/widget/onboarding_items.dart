import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:real_state/core/constants/styles.dart';
import '../../../data/model/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(model.lottieAsset),
          const SizedBox(height: 24),
          Text(
            model.title,
            style:AppTextStyles.headline(context).copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            model.subtitle,
            style: AppTextStyles.title(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
