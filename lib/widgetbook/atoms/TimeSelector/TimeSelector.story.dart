import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/widgetbook/atoms/index.dart';
import 'package:widgetbook/widgetbook.dart';

TimeSelectorStory() {
  TimeOfDay time = const TimeOfDay(hour: 10, minute: 00);
  return WidgetbookComponent(name: 'TimeSelector', useCases: [
    WidgetbookUseCase(
        name: 'TimeSelector',
        builder: (context) {
          Widget res = TimeSelector(
            setTime: (t) {},
          );
          return res;
        }),
  ]);
}
