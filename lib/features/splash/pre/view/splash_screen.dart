import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/constants/app_images.dart';
import '../view_model/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..startAnimationAndNavigate(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4199C3), Colors.white],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Center(
                child: AnimatedOpacity(
                  opacity: state.logoVisible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2),
                  child: AnimatedScale(
                    scale: state.logoVisible ? 1.0 : 0.8,
                    duration: const Duration(seconds: 4),
                    child: Image.asset(AppImages.splash, width: 300),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
