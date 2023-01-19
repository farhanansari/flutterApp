import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './HeaderBar.dart';

HeaderBarStory() {
  return WidgetbookComponent(name: 'HeaderBar', useCases: [
    WidgetbookUseCase(
        name: 'HeaderBar',
        builder: (context) => Center(
                child: HeaderBar(
              onSignOut: () {},
            ))),
  ]);
}
