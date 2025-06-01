import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:real_state/core/dio/dio_helper.dart';
import 'package:real_state/core/helper/failures.dart';
import 'package:real_state/core/shared_preferences/cach_helper.dart';

import '../models/fav_model.dart';

class FavoriteRepository {
  final Dio dio = Dio();

  Future<void> addToFavorite(String unitId) async {
    final token = CacheHelper.getSaveData(key: "token");
    if (token == null) throw Exception("الرجاء تسجيل الدخول أولاً");

    final response = await dio.post(
      "https://propertyapi.runasp.net/Favorite?unitId=$unitId",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    if (response.statusCode != 200) {
      throw Exception("فشل في الإضافة إلى المفضلة");
    }
  }

  Future<Either<Failures, FavoriteModel>> getFavorites() async {
    try {
      final response = await DioHelper.getData(
        url: "Favorite/Get-Favorites/0",
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
        return Right("تم الحذف بنجاح");
      } else {
        return Left(ServerFailure("فشل في الحذف"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}