import 'package:example_practise_app/screens/forgot_password.dart';
import 'package:example_practise_app/screens/home_screen.dart';
import 'package:example_practise_app/screens/login_screen.dart';
import 'package:example_practise_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:example_practise_app/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        MyRoutes.homeScreen: (context) => const HomeScreen(),
        MyRoutes.loginScreen: (context) => const LoginScreen(),
        MyRoutes.signUp: (context) => const SignUp(),
        MyRoutes.forgotPassword: (context) => const ForgotPassword(),
      },
    );
  }
}