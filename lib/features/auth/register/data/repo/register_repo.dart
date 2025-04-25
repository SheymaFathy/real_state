import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real_state/core/helper/hosting.dart';
import 'package:real_state/features/auth/register/data/model/register_user_model.dart';

class RegisterRepository {

  Future<Map<String, dynamic>?> register(RegisterUserModel user) async {
    try {
      final uri = Uri.parse('${Hostting.register}');
      var request = http.MultipartRequest('POST', uri);

      user.toMap().forEach((key, value) {
        if (value != null) {
          request.fields[key] = value.toString();
        }
      });

      final response = await request.send();

      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print("Done");
        final decoded = json.decode(responseBody);
        return decoded;
      } else {
        print("Registration failed: $responseBody");
        return null;
      }
    } catch (e) {
      print("Error occurred during registration: $e");
      return null;
    }
  }

}
