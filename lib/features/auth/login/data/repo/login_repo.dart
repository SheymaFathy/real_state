import 'package:dartz/dartz.dart';
import 'package:real_state/core/dio/dio_helper.dart';
import 'package:real_state/core/helper/failures.dart';
import 'package:real_state/features/auth/register/data/model/register_response.dart';

class LoginRepository {
  Future<Either<Failures, RegisterResponse>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: "Auth/login",
        data: {'email': email, 'password': password},
      );
      final user = RegisterResponse.fromJson(response.data);
      if (user.status == true) {
        return Right(user);
      } else {
        return left(ServerFailure(user.message.toString()));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
