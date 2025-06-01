import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../model/rating_model.dart';

class RatingRepository {
  final Dio dio;

  RatingRepository({Dio? dioClient}) : dio = dioClient ?? Dio();

  Future<bool> submitRating(RatingModel rating) async {
    try {
      final response = await dio.post(
        'https://propertyapi.runasp.net/Ratings',
        data: rating.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Rating submission error: $e');
      }
      return false;
    }
  }
}
