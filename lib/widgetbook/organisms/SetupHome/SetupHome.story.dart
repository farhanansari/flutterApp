import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './SetupHome.dart';

SetupHomeStory() {
  return WidgetbookComponent(name: 'SetupHome', useCases: [
    WidgetbookUseCase(
        name: 'SetupHome Page',
        builder: (context) => Center(child: SetupHome())),
  ]);
}
