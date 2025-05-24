import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:real_state/features/auth/login/data/repo/login_repo.dart';
import '../../../../../core/shared_preferences/cach_helper.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginCubit(this.loginRepository) : super(LoginInitial());

  Future<void> loginUser(BuildContext context) async {
    emit(LoginLoading());
    final response = await loginRepository.loginUser(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    response.fold(
      (l) {
        emit(LoginFailure("Login failed. Please check your credentials."));
      },
      (r) async {
        emit(LoginSuccess(r));
        await CacheHelper.saveData(key: 'token', value: r.data?[0].token);
        await CacheHelper.saveData(key: 'username', value: r.data?[0].username);
        await CacheHelper.saveData(key: 'email', value: r.data?[0].email);
      },
    );
  }
}
