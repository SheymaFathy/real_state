// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(logoVisible: false));

  void startAnimationAndNavigate(BuildContext context) {
    // Start animation
    Future.delayed(const Duration(milliseconds: 500), () {
      emit(SplashState(logoVisible: true));
    });

    // Navigate after delay
    Timer(const Duration(seconds: 3), () async {
      context.go('/main_screen');
    });
  }
}
