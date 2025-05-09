// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../../core/shared_preferences/cach_helper.dart';
import '../model/unit_model.dart';

class UnitRepository {
  // get all units
  Future<List<UnitModel>> getAllUnits() async {
    final response = await http.get(
      Uri.parse("https://propertyapi.runasp.net/Units/Get-All-Units"),
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List<dynamic> data = decoded["data"];
      return data.map((json) => UnitModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch units");
    }
  }

  //   get hot deals
  Future<List<UnitModel>> getHotDeals() async {
    final response = await http.get(
      Uri.parse("https://propertyapi.runasp.net/Units/Hot-Deals-Units"),
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List<dynamic> data = decoded["data"];
      return data.map((json) => UnitModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch hot deals");
    }
  }

  // get unit details
  Future<List<UnitModel>> getUnitDetails(int id) async {
    final response = await http.get(
      Uri.parse("https://propertyapi.runasp.net/Units/$id"),
    );
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      if (decoded['data'] != null && decoded['data'] is List) {
        final List<dynamic> data = decoded["data"];
        return data.map((json) => UnitModel.fromJson(json)).toList();
      } else {
        throw Exception("البيانات غير صحيحة أو غير موجودة");
      }
    } else {
      throw Exception("فشل في جلب التفاصيل");
    }
  }

  // add to favorite
  Future<bool> addToFavorite(int id) async {
    final token = CacheHelper.getSaveData(
      key: 'token',
    ); // تأكد من الحصول على التوكن
    final url = Uri.parse("https://propertyapi.runasp.net/Favorite?unitId=$id");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token', // إضافة التوكن إلى الهيدر
      },
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return decoded['success'] == true;
    } else {
      print("Add Favorite Error → Status: ${response.statusCode}");
      print("Body: ${response.body}");
      throw Exception("فشل في الإضافة إلى المفضلة");
    }
  }

  // remove from favorite
  Future<bool> removeFromFavorite(int id) async {
    final token = CacheHelper.getSaveData(
      key: 'token',
    ); // تأكد من الحصول على التوكن
    final url = Uri.parse("https://propertyapi.runasp.net/Favorite?unitId=$id");

    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token', // إضافة التوكن إلى الهيدر
      },
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return decoded['success'] == true;
    } else {
      print("Remove Favorite Error → Status: ${response.statusCode}");
      print("Body: ${response.body}");
      throw Exception("فشل في الحذف من المفضلة");
    }
  }
}
