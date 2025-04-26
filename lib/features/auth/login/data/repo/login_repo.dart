import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<Map<String, dynamic>?> login({
    required String email,
    required String password,
    required String token,
  }) async {
    try {
      var uri = Uri.parse('https://propertyproapi.runasp.net/Auth/login');
      var headers = {
        'accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await http.post(
        uri,
        headers: headers,
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Login Success: ${response.body}");
        }
        final decoded = json.decode(response.body);
        return decoded;
      } else {
        if (kDebugMode) {
          print("Login Failed: ${response.reasonPhrase}");
        }
        return null;
      }
    } catch (e) {
      print("Error occurred during login: $e");
      return null;
    }
  }
}
