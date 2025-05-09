import 'package:flutter/cupertino.dart';
import 'package:real_state/core/helper/context_extensions.dart';

import '../model/onboarding_model.dart';
import 'package:flutter/material.dart';


class OnboardingRepository {
  static List<OnboardingModel> getPages(BuildContext context) {
    final loc = context.loc;
    return [
      OnboardingModel(
        title:  loc.translate("onboarding_title_1"),
        subtitle: loc.translate("onboarding_description_1"),
        lottieAsset: "assets/lottie/on1.json",
      ),
      OnboardingModel(
        title: loc.translate("onboarding_title_2"),
        subtitle:
        loc.translate("onboarding_description_2"),
        lottieAsset: "assets/lottie/on2.json",
      ),
      OnboardingModel(
        title: loc.translate("onboarding_title_3"),
        subtitle:
        loc.translate("onboarding_description_3"),
        lottieAsset: "assets/lottie/on3.json",
      ),
    ];
  }
}

