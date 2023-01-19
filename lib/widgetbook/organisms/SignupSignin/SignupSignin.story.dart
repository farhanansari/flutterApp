import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './SignupSignin.dart';

SignupSigninStory() {
  return WidgetbookComponent(name: 'SignupSignin', useCases: [
    WidgetbookUseCase(
        name: 'SignupSignin Page',
        builder: (context) => Center(
                child: SignupSignin(
              signInCallback: (String email, String password) {},
              signUpCallback: (String email, String password) {},
            ))),
  ]);
}
