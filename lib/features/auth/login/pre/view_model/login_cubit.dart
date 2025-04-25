import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/features/auth/login/data/model/login_user_model.dart';
import 'package:real_state/features/auth/login/data/repo/login_repo.dart';
import 'package:real_state/features/auth/login/data/storage_helper.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginCubit(this.loginRepository) : super(LoginInitial());

  Future<void> loginUser(LoginUserModel user) async {
    emit(LoginLoading());

    try {
      final response = await loginRepository.login(
        email: user.email.trim(),
        password: user.password,
        token: '',
      );

      if (response != null && response.containsKey("token")) {
        await StorageHelper.saveToken(response["token"]);
        emit(LoginSuccess(response));
      } else {
        emit(LoginFailure("Login failed. Please check your credentials."));
      }
    } catch (e) {
      emit(LoginFailure("Something went wrong: $e"));
    }
  }

}
