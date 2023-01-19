import 'package:flutter/material.dart';
import '../../molecules/Signin/Signin.dart';
import '../../molecules/Signup/Signup.dart';

class SignupSignin extends StatefulWidget {
  final Function(String, String) signInCallback;
  final Function(String, String) signUpCallback;

  const SignupSignin(
      {super.key, required this.signInCallback, required this.signUpCallback});

  @override
  State<SignupSignin> createState() => _SignupSigninState();
}

class _SignupSigninState extends State<SignupSignin> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //title: const Text('theCuts'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('Sign In'),
              ),
              Tab(child: Text('Sign Up')),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
                child: SignIn(
              onSubmit: widget.signInCallback,
            )),
            Center(
              child: Signup(onSubmit: widget.signUpCallback),
            ),
          ],
        ),
      ),
    );
  }
}
