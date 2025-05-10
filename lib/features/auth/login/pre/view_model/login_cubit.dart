import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:real_state/features/auth/login/data/repo/login_repo.dart';
import '../../../../../core/helper/routes.dart';
import '../../../../../core/shared_preferences/cach_helper.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginCubit(this.loginRepository) : super(LoginInitial());

  Future<void> loginUser(BuildContext context) async {
    emit(LoginLoading());

    try {
      final response = await loginRepository.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response != null &&
          response.containsKey("data") &&
          response['data'].isNotEmpty) {
        final data = response['data'][0];

        final token = data['token'] ?? '';
        final username = data['username'] ?? '';
        final email = data['email'] ?? '';
        final userId = data['id']?.toString() ?? '';
        await CacheHelper.saveData(key: 'token', value: token);
        await CacheHelper.saveData(key: 'username', value: username);
        await CacheHelper.saveData(key: 'email', value: email);
        await CacheHelper.saveData(key: 'userId', value: userId);

        emit(LoginSuccess(response));

        if (context.mounted) {
          context.go(AppRoutes.mainScreen);
        }
      } else {
        emit(LoginFailure("Login failed. Please check your credentials."));
      }
    } catch (e) {
      emit(LoginFailure("Something went wrong: $e"));
      if (kDebugMode) {
        print("Login error: $e");
      }
    }
  }
}
