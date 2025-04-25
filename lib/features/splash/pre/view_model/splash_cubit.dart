import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/login/pre/view/login_screen.dart';
import '../../../main_screen/pages/home/pre/view/home_page.dart';

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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) =>  HomePage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) =>  LoginScreen()),
        );
      }
    });
  }
}
