// ignore_for_file: avoid_print
import 'package:real_state/core/dio/dio_helper.dart';
import 'package:real_state/features/auth/register/data/model/register_response.dart';
import 'package:real_state/features/auth/register/data/model/register_user_model.dart';

class RegisterRepository {
  Future<RegisterResponse> register(RegisterUserModel request) async {
    try {
      final response = await DioHelper.postData(
        url: "Auth/register",
        qurey: request.toMap(),
      );
      final user = RegisterResponse.fromJson(response.data);

      if (user.statusCode == 200 || user.statusCode == 400) {
        if (user.status == true) {
          print("Registration successful");
          print("Register Token ${user.data?[0].token}");

          return user;
        } else {
          print("Registration failed: ${user.message}");
          throw Exception(user.message ?? "Registration failed");
        }
      } else {
        print("Unexpected error: ${response.statusCode}");
        throw Exception("Unexpected error occurred");
      }
    } catch (e) {
      print("Error occurred during registration: $e");
      throw Exception("Error occurred during registration: $e");
    }
  }
}
