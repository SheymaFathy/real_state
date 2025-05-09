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
      return {"Accept": "*/*", "Content-Type": "application/json"};
    }

    return {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  // API endpoints

  // auth
  static Uri login = Uri.parse("$host/Auth/login");
  static Uri register = Uri.parse("$host/Auth/register");
  // get data
  static Uri getAllUnits = Uri.parse("$host/Units/Get-All-Units");
  static Uri hotDealUnits = Uri.parse("$host/Units/Hot-Deals-Units");
  static Uri unitDetails = Uri.parse("$host/Units/");
  static Uri addFavorite = Uri.parse("$host/Favorite");

}
