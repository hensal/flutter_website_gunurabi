import 'package:example_practise_app/API_SERVICE/resetpassword_service.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  final String token;

  const ResetPasswordPage({super.key, required this.token});

  @override
  // ignore: library_private_types_in_public_api
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _verifyPasswordController = TextEditingController();
  String? _errorText;

  Future<void> _submitNewPassword() async {
    String newPassword = _newPasswordController.text;
    String verifyPassword = _verifyPasswordController.text;

    // Basic password match validation
    if (newPassword.isEmpty || verifyPassword.isEmpty) {
      setState(() {
        _errorText = "Please fill in both fields.";
      });
      return;
    }

    if (newPassword != verifyPassword) {
      setState(() {
        _errorText = "Passwords do not match.";
      });
      return;
    }

    // Send new password to backend
    var response = await AuthService.resetPassword(widget.token, newPassword);

    if (response['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password successfully reset!')),
      );
      // Redirect to login page
      Navigator.pop(context);
    } else {
      setState(() {
        _errorText = response['message'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Enter your new password and verify it.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  border: const OutlineInputBorder(),
                  errorText: _errorText,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _verifyPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Verify Password',
                  border: const OutlineInputBorder(),
                  errorText: _errorText,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitNewPassword,
                child: const Text('Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
