import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'TaskLineItem.dart';

TaskLineItemStory() {
  return WidgetbookComponent(name: 'TaskLineItem', useCases: [
    WidgetbookUseCase(
        name: 'TaskLineItem',
        builder: (context) => Center(
                child: TaskLineItem(
              title: 'This is a test title',
              description: 'Test description...',
              complete: true,
            ))),
  ]);
}
