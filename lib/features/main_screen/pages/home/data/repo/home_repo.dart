// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real_state/core/shared_preferences/cach_helper.dart';
import '../model/unit_model.dart';

class UnitRepository {
  // get all units
  Future<List<UnitModel>> getAllUnits() async {
    try {
      final response = await http.get(
        Uri.parse("https://propertyapi.runasp.net/Units/Get-All-Units"),
      );

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        final List<dynamic> data = decoded["data"];

        return data.map((json) {
          print("Unit JSON: $json");
          return UnitModel.fromJson(json);
        }).toList();

      } else {
        throw Exception("فشل في جلب الوحدات: ${response.body}");
      }
    } catch (e) {
      print(" Error in getAllUnits → $e");
      rethrow;
    }
  }


  // get hot deals
  Future<List<UnitModel>> getHotDeals() async {
    try {
      final response = await http.get(
        Uri.parse("https://propertyapi.runasp.net/Units/Hot-Deals-Units"),
      );

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        final List<dynamic> data = decoded["data"];
        return data.map((json) => UnitModel.fromJson(json)).toList();
      } else {
        throw Exception("فشل في جلب العروض الساخنة: ${response.body}");
      }
    } catch (e) {
      print("Error in getHotDeals → $e");
      rethrow;
    }
  }

  // get unit details
  Future<List<UnitModel>> getUnitDetails(int id) async {
    try {
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
        throw Exception("فشل في جلب التفاصيل: ${response.body}");
      }
    } catch (e) {
      print("Error in getUnitDetails → $e");
      rethrow;
    }
  }


  // add to favorite
  Future<bool> toggleFavorite(int unitId, String userId, Map<String, dynamic> bodyParams) async {
    print("unitId: $unitId");
    final url = Uri.parse('https://propertyapi.runasp.net/Favorite');
    final token = CacheHelper.getSaveData(key: 'token')?.toString() ?? '';
    try {
      final response = await http.post(
        url,
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          ...bodyParams,
          'unitId': unitId,
        }),
      );
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['isFavorite'] ?? false;
      } else {
        throw Exception('Failed to toggle favorite: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network Error: $e');
    }
  }



}
