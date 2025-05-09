// lib/features/auth/logout/presentation/cubit/logout_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/helper/routes.dart';
import 'package:real_state/core/shared_preferences/cach_helper.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logoutUser(BuildContext context) async {
    emit(LogoutLoading());
    try {
      await CacheHelper.clearData(key: 'token');
      await CacheHelper.clearData(key: 'username');
      await CacheHelper.clearData(key: 'email');
      await CacheHelper.clearData(key: 'phone');

      emit(LogoutSuccess());
      if (context.mounted) {
        context.go(AppRoutes.login);
      }
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}
