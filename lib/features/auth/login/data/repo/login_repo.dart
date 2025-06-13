import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:real_state/core/dio/dio_helper.dart';
import 'package:real_state/core/helper/failures.dart';
import 'package:real_state/core/shared_preferences/cach_helper.dart';
import 'package:real_state/features/auth/login/data/model/user_details.dart';
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
        decode(user.data?.first.token ?? "");
        return Right(user);
      } else {
        return left(ServerFailure(user.message.toString()));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}

Map<String, dynamic> decode(String token) {
  final splitToken = token.split(".");
  if (splitToken.length != 3) {
    throw const FormatException('Invalid token');
  }
  try {
    final payloadBase64 = splitToken[1];
    final normalizedPayload = base64.normalize(payloadBase64);
    final payloadString = utf8.decode(base64.decode(normalizedPayload));
    final decodedPayload = jsonDecode(payloadString);
    UserDetails userModel = UserDetails.fromJson(decodedPayload);
    print(userModel.toJson());
    CacheHelper.saveData(
      key: "userId",
      value:
          userModel.httpschemasxmlsoaporgws200505identityclaimsnameidentifier,
    );
    // CacheHelper.saveData(key: AppConstants.regionId, value: userModel.regionId);
    return decodedPayload;
  } catch (error) {
    print("Token decoding failed: $error");
    print("Raw token: $token");
    throw const FormatException('Invalid payload');
  }
}
