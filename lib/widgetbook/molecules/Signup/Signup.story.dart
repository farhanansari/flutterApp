import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './Signup.dart';

SignupStory() {
  return WidgetbookComponent(name: 'Signup', useCases: [
    WidgetbookUseCase(
        name: 'Signup Page',
        builder: (context) =>
            Center(child: Signup(onSubmit: (String email, String password) {
              print("TESTING");
            })))
  ]);
}
