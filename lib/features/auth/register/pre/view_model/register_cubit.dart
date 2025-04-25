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

  Future<void> register(RegisterUserModel user) async {
    try {
      emit(RegisterLoading());

      final response = await _registerRepository.register(user);

        emit(RegisterSuccess("Registration successful"));
        print(response);

    } catch (e) {
      emit(RegisterFailure("Registration failed: $e"));
    }
  }
}
