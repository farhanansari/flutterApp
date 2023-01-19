import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './Address.dart';

AddressStory() {
  return WidgetbookComponent(name: 'Address', useCases: [
    WidgetbookUseCase(
        name: 'Address',
        builder: (context) =>
            Center(child: Address(customTitle: "TESTING TITLE"))),
  ]);
}
