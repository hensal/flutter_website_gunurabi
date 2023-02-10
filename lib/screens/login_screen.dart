import 'package:example_practise_app/router.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             //image assets        
               const Text('Welcome!',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.w500,
                        ),  
                      ),                               
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Enter Your Username/Email',
                        labelText: 'Email or Username',
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Enter Your Password',
                        labelText: 'Password',
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.forgotPassword);
                      },
                      child: const Text(
                        'Forgot Password?',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton.icon(
                      onPressed: (() {
                        Navigator.pushNamed(context, MyRoutes.homeScreen);
                      }),
                      icon: const Icon(Icons.login),
                      label: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: (() {
                            Navigator.pushNamed(
                              context,
                              MyRoutes.signUp,
                            );
                          }),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}