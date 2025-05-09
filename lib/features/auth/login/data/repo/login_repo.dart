import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../../core/helper/hosting.dart';

class LoginRepository {
  Future<Map<String, dynamic>?> login({
    required String email,
    required String password,
  }) async {
    try {
      var uri = Hostting.login;

      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      var response = await http.post(
        uri,
        headers: headers,
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Login Success: ${response.body}");
        }
        final decoded = json.decode(response.body);
        return decoded;
      } else {
        if (kDebugMode) {
          print("Login Failed: ${response.statusCode}");
          print("Response Body: ${response.body}");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error occurred during login: $e");
      }
      return null;
    }
  }
}
