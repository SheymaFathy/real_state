// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real_state/core/helper/hosting.dart';
import 'package:real_state/features/auth/register/data/model/register_user_model.dart';

class RegisterRepository {
  Future<Map<String, dynamic>> register(RegisterUserModel user) async {
    try {
      final uri = Hostting.register;
      var request = http.MultipartRequest('POST', uri);

      user.toMap().forEach((key, value) {
        if (value != null) {
          request.fields[key] = value.toString();
        }
      });

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final decoded = json.decode(responseBody);

      if (response.statusCode == 200 || response.statusCode == 400) {
        if (decoded['status'] == true) {
          print("Registration successful");
          return decoded;
        } else {
          print("Registration failed: ${decoded['message']}");
          throw Exception(decoded['message'] ?? "Registration failed");
        }
      } else {
        print("Unexpected error: ${response.statusCode}");
        throw Exception("Unexpected error occurred");
      }
    } catch (e) {
      print("Error occurred during registration: $e");
      throw Exception("Error occurred during registration: $e");
    }
  }
}
