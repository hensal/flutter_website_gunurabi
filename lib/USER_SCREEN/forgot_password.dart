import 'package:example_practise_app/API_SERVICE/forgotpassword_service.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  String? _errorText;

  void _submitEmail() async {
    String email = _emailController.text;

    // Dummy validation (replace with your actual email validation logic)
    if (email.isEmpty || !email.contains('@gmail.com')) {
      setState(() {
        _errorText = "Please enter a valid email !!!";
      });
    } else {
      setState(() {
        _errorText = null;
      });

      // Call the AuthService to send the reset link
      var response = await AuthService.sendResetLink(email);

      if (response['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );
      } else {
        setState(() {
          _errorText = response['message'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.info, size: 80, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                "Forgot Password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Enter your email and we'll send you a link to reset your password.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 400, // Set the desired width here
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.email),
                    errorText: _errorText,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 400, // Set the same width as the TextFormField
                child: ElevatedButton(
                  onPressed: _submitEmail,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Submit"),
                ),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the login screen
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Back to Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
