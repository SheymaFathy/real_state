import '../shared_preferences/cach_helper.dart'; // عدّل المسار حسب مكان ملفك

class Hostting {
  static const String host = "https://propertyproapi.runasp.net";

  // Header
  Future<Map<String, String>> getHeader() async {
    final token = CacheHelper.getSaveData(key: 'token') ?? '';

    if (token.isEmpty) {
      return {
        "Accept": "*/*",
        "Content-Type": "application/json",
      };
    }

    return {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  // API endpoints
  static Uri login = Uri.parse("$host/Auth/login");
  static Uri register = Uri.parse("$host/Auth/register");
  static Uri getAllUnits = Uri.parse("$host/Units/Get-All-Units");
  static Uri hotDealUnits = Uri.parse("$host/Units/Hot-Deals-Units");
  static Uri unitDetails = Uri.parse("$host/Units/");
  static Uri addFavorite = Uri.parse("$host/Favorite");
}
