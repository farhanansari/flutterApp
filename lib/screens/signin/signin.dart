import 'package:flutter_widgetbook/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/widgetbook/organisms/SignupSignin/SignupSignin.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

testfunc(int i) {
  print("This is a test function $i");
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          title: const Text('Sign in')),
      body: SafeArea(
        child: SignupSignin(
            signInCallback: _auth.signIn, signUpCallback: _auth.signUp),
      ),
    );
  }
}
