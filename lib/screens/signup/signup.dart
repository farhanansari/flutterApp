import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_widgetbook/services/auth.dart';

class Signup extends StatefulWidget {
  final Function signupCallback;

  const Signup({super.key, required this.signupCallback});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.blue, title: const Text('Register')),
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  TextField(
                      decoration: const InputDecoration(labelText: "Email"),
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                  const SizedBox(height: 20.0),
                  TextField(
                      decoration: const InputDecoration(labelText: "Password"),
                      onChanged: (val) {
                        setState(() => password = val);
                      }),
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          await widget.signupCallback(email, password);
                        } on FirebaseAuthException catch (e) {
                          print("ERROR: ${e.message}");

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "${e.message}",
                                  style: const TextStyle(color: Colors.white),
                                )),
                          );
                        }
                      },
                      child: const Text('Sign Up'))
                ],
              )),
        ));
  }
}
