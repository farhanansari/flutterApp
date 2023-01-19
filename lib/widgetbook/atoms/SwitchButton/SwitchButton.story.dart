import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/widgetbook/atoms/SwitchButton/SwitchButton.dart';
import 'package:widgetbook/widgetbook.dart';

SwitchButtonStory() {
  bool myValue = false;
  return WidgetbookComponent(name: 'SwitchButton', useCases: [
    WidgetbookUseCase(
        name: 'SwitchButton',
        builder: (context) => Center(
            child: SwitchButton(
                value: myValue,
                onChange: (v) {
                  myValue = !myValue;
                },
                activateColor: Colors.blue))),
  ]);
}
