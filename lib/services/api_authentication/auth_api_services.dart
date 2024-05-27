import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String baseUrl = "http://apps.ihitsindia.com:319";

  Future<Map<String, dynamic>> loginUser(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'VerifyUserDetails': [
            {
              'UserName': username,
              'PassWord': password,
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          'Code': 0,
          'Message': 'Authentication failed with status code: ${response.statusCode}'
        };
      }
    } catch (e) {
      throw Exception('Failed to authenticate user: $e');
    }
  }
}
