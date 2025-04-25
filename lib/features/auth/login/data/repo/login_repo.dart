import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<Map<String, dynamic>?> login({
    required String email,
    required String password,
    required String token, // إضافة المتغير token
  }) async {
    try {
      var uri = Uri.parse('https://propertyproapi.runasp.net/Auth/login');

      // الرؤوس الخاصة بالطلب
      var headers = {
        'accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // إضافة الـ Bearer token هنا
      };

      // إرسال الطلب عبر POST مع البيانات في الـ Body
      var response = await http.post(
        uri,
        headers: headers,
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        print("Login Success: ${response.body}");
        final decoded = json.decode(response.body);
        return decoded;
      } else {
        print("Login Failed: ${response.reasonPhrase}");
        return null;
      }
    } catch (e) {
      print("Error occurred during login: $e");
      return null;
    }
  }
}
