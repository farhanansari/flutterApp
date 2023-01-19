import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './Signin.dart';

SigninStory() {
  return WidgetbookComponent(name: 'Signin', useCases: [
    WidgetbookUseCase(
        name: 'Signin Page',
        builder: (context) => Center(
                child: SignIn(
              onSubmit: (String email, String password) {},
            ))),
  ]);
}
