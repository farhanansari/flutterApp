import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './ServiceHours.dart';

ServiceHoursStory() {
  return WidgetbookComponent(name: 'ServiceHours', useCases: [
    WidgetbookUseCase(
        name: 'Service Hours Page',
        builder: (context) => Center(
                child: ServiceHours(
              customTitle: 'custom title',
            ))),
  ]);
}
