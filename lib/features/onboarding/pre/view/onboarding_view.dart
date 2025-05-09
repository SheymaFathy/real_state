import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/colors.dart';
import 'package:real_state/core/helper/routes.dart';
import 'package:real_state/features/onboarding/pre/view/widget/onboarding_items.dart';
import '../../data/repo/onboarding_repo.dart';
import '../view_model/onboarding_cubit.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = OnboardingRepository.getPages(context);
    final controller = PageController();

    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: controller,
              itemCount: pages.length,
              onPageChanged: (index) =>
                  context.read<OnboardingCubit>().updatePage(index),
              itemBuilder: (_, index) => OnboardingItem(model: pages[index]),
            ),
            Positioned(
              bottom: 24,
              right: 24,
              child: BlocBuilder<OnboardingCubit, int>(
                builder: (context, state) {
                  return IconButton(
                    icon: const Icon(Icons.play_circle_fill_rounded, size: 50),
                    color: AppColors.primary(context),
                    onPressed: () {
                      if (state < pages.length - 1) {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                        context.read<OnboardingCubit>().updatePage(state + 1);
                      } else {
                       context.go(AppRoutes.mainScreen);
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}