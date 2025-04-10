import 'package:http/http.dart' as http;

class AuthService {
  static Future<Map<String, dynamic>> resetPassword(String token, String newPassword) async {
    try {
      final response = await http.post(
        Uri.parse('http://your-backend-url/reset-password'),
        body: {
          'token': token,
          'new_password': newPassword,
        },
      );

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Password successfully reset.'};
      } else {
        return {'success': false, 'message': 'Failed to reset password.'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Error: $e'};
    }
  }
}
