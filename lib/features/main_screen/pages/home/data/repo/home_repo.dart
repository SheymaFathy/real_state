import 'dart:convert';
import 'package:http/http.dart' as http;
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
}