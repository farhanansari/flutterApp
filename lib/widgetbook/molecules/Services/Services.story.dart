import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './Services.dart';

ServicesStory() {
  return WidgetbookComponent(name: 'Services', useCases: [
    WidgetbookUseCase(
        name: 'Services',
        builder: (context) => Center(
                child: Services(
              addService: (ServiceModel) {},
              services: [],
            ))),
  ]);
}
