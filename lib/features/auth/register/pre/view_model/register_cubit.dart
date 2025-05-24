// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:real_state/features/auth/register/pre/view_model/register_state.dart';
import 'package:real_state/features/auth/register/data/model/register_user_model.dart';
import '../../data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final RegisterRepository _registerRepository;

  RegisterCubit(this._registerRepository) : super(RegisterInitial());

  Future<void> register(RegisterUserModel request) async {
    try {
      emit(RegisterLoading());

      final user = await _registerRepository.register(request);
      emit(RegisterSuccess(user.message ?? "Registration successful"));
    } catch (e) {
      emit(RegisterFailure(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}