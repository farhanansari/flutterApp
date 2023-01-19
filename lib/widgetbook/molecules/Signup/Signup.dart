import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  final Function(String, String) onSubmit;
  Signup({super.key, required this.onSubmit});

  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> formData = {
    'fname': {
      'label': 'First Name',
      'errorText': 'First Name is required',
      'isValid': true,
      'value': '',
      'required': true
    },
    'lname': {
      'label': 'Last Name',
      'errorText': 'Last Name is required',
      'isValid': true,
      'value': '',
      'required': true
    },
    'email': {
      'label': 'Email',
      'errorText': 'Email is required',
      'isValid': true,
      'value': '',
      'required': true
    },
    'password': {
      'label': 'Password',
      'errorText': 'Password is required',
      'isValid': true,
      'value': '',
      'required': true
    }
  };

  _validate(key, value) {
    if (formData[key]["required"] == true && value.isEmpty) {
      return formData[key]["errorText"];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
/*       const SizedBox(height: 20),
      const Text(
        "Sign Up",
        style: TextStyle(fontSize: 20),
      ), */
      Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                  onChanged: (value) => formData["fname"]["value"] = value,
                  decoration:
                      InputDecoration(labelText: formData["fname"]["label"]),
                  validator: ((value) => _validate("fname", value))),
/*              TextFormField(
                  onChanged: (value) => formData["lname"]["value"] = value,
                  decoration:
                      InputDecoration(labelText: formData["lname"]["label"]),
                  validator: ((value) => _validate("lname", value))), */
              TextFormField(
                  onChanged: (value) => formData["email"]["value"] = value,
                  decoration:
                      InputDecoration(labelText: formData["email"]["label"]),
                  validator: ((value) => _validate("email", value))),
              TextFormField(
                  onChanged: (value) => formData["password"]["value"] = value,
                  decoration:
                      InputDecoration(labelText: formData["password"]["label"]),
                  validator: ((value) => _validate("password", value))),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        try {
                          final UserCredential result = await onSubmit(
                              formData["email"]["value"],
                              formData["password"]["value"]);
                          User? user = result.user;
                          user?.updateDisplayName(formData['fname']['value']);

                          print(result);
                        } on FirebaseAuthException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Error, ${e.message} - ${e.code}!',
                                  style: const TextStyle(color: Colors.white),
                                )),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                'Invalid form entry, please try again!',
                                style: TextStyle(color: Colors.white),
                              )),
                        );
                      }
                    },

                    /* () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        onSubmit();

                        print("SIGNUP IS PRESSED");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                'Invalid form entry, please try again!',
                                style: TextStyle(color: Colors.white),
                              )),
                        );
                      }
                    }, */
                    child: const Text('Submit'),
                  ))
            ])),
      ),
    ]);
  }
}
