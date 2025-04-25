import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../auth/login/data/storage_helper.dart';
import '../model/unit_model.dart';

class HomeRepository {
  Future<List<UnitModel>> fetchUnits() async {
    final token = await StorageHelper.getToken();

    final url = Uri.parse(
      'https://propertyproapi.runasp.net/Units/Get-All-Units?page=1&pageSize=50',
    );

    final response = await http.get(
      url,
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );

    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((unitJson) => UnitModel.fromJson(unitJson)).toList();
    } else {
      throw Exception('فشل في تحميل الوحدات');
    }
  }
}
