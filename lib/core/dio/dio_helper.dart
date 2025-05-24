// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import '../shared_preferences/cach_helper.dart';

class DioHelper {
  static Dio? dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://propertyapi.runasp.net/",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Authorization': "Bearer ${CacheHelper.getSaveData(key: "token")}",
          'Accept': '*/*',
        },
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio?.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? qurey,
    data,
  }) async {
    return dio!.post(url, queryParameters: qurey, data: data);
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? qurey,
    data,
  }) async {
    print("in dio Helper");
    try {
      print("in dio Helper try 1");

      final response = await dio!.delete(
        url,
        queryParameters: qurey,
        data: data,
      );
      print("in dio Helper try 2 ${response.data}");

      return response;
    } catch (e) {
      print("error in Delete item $e");
      throw Exception('error in Delete item $e');
    }
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? qurey,
    Map<String, dynamic>? data,
  }) async {
    return dio!.put(url, queryParameters: qurey, data: data);
  }
}
