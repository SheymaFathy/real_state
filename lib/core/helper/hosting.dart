import 'package:shared_preferences/shared_preferences.dart';

class Hostting {
  static const String host = "https://propertyproapi.runasp.net";
  late String token;

  Hostting(this.token);

  // Header
  Future<Map<String, String>> getHeader() async {
    final prefs = await SharedPreferences.getInstance();

    // Get token from SharedPreferences
    token = prefs.getString('token') ?? '';

    // Check if the token is null or empty in a simplified way
    if (token.isEmpty) {
      return {"Accept": "application/json", "Content-Type": "application/json"};
    }

    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  // API endpoints
  static Uri login = Uri.parse("$host/Auth/login");
  static Uri register = Uri.parse("$host/Auth/register");
  static Uri getAllUnits = Uri.parse("$host/Units/Get-All-Units");

}
