import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:real_state/core/dio/dio_helper.dart';
import 'package:real_state/core/helper/failures.dart';
import 'package:real_state/core/shared_preferences/cach_helper.dart';

import '../models/fav_model.dart';

class FavoriteRepository {
  final Dio dio = Dio();

  Future<Either<Failures, String>> addToFavorite(String unitId) async {
    final token = CacheHelper.getSaveData(key: "token");
    if (token == null) throw Exception("الرجاء تسجيل الدخول أولاً");
    try {
      final response = await dio.post(
        "https://propertyapi.runasp.net/Favorite?unitId=$unitId",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        // SnackBar(
        //   content: Text("تم الإضافة بنجاح"),
        //   backgroundColor: Colors.red,
        // );
        return Right("تم الإضافة بنجاح");
      } else {
        return Left(ServerFailure("فشل في الإضافة"));
      }
    } catch (e) {
      // SnackBar(
      //   content: Text("add to favorite before"),
      //   backgroundColor: Colors.red,
      // );
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failures, FavoriteModel>> getFavorites() async {
    try {
      final response = await DioHelper.getData(
        url: "Favorite/Get-Favorites/${CacheHelper.getSaveData(key: "userId")}",
      );

      if (response?.statusCode == 200) {
        final user = FavoriteModel.fromJson(response?.data);

        return Right(user);
      } else {
        return Left(ServerFailure("فشل في جلب المفضلة"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failures, String>> deleteFavorite(int unitId) async {
    try {
      final response = await DioHelper.deleteData(
        url: "Favorite",
        qurey: {"unitId": unitId},
      );
      if (response.statusCode == 200) {
        getFavorites();
        return Right("تم الحذف بنجاح");
      } else {
        return Left(ServerFailure("فشل في الحذف"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
