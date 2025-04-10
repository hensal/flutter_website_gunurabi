import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  static const String _url = 'http://localhost:3000/login'; // Replace with your backend URL

  // Login user with email and password
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);   // Return user data on successful login
    } else {
      return {'error': 'Invalid credentials, Pleae re-check email and password!!!'}; // Return error message if login fails
    }
  }
}
