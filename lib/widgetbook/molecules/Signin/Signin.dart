import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function(String, String) onSubmit;
  const SignIn({super.key, required this.onSubmit});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              const SizedBox(height: 20.0),
              TextField(
                  decoration: const InputDecoration(labelText: "Email"),
                  onChanged: ((val) => email = val)),
              const SizedBox(height: 20.0),
              TextField(
                decoration: const InputDecoration(labelText: "Password"),
                onChanged: ((value) => password = value),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      UserCredential result =
                          await widget.onSubmit(email, password);
                      print("RESULT: $result");
                    } on FirebaseAuthException catch (e) {
                      print("ERROR: ${e.code}");
                      FocusManager.instance.primaryFocus?.unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Error, ${e.message} - ${e.code}!',
                            style: const TextStyle(color: Colors.white),
                          )));
                    }
                  },
                  child: const Text('Sign Inn')),
              const SizedBox(height: 20.0),
            ])),
      ],
    );
  }
}
