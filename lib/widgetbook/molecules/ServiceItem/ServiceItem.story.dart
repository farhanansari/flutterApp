import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/models/service.dart';
import 'package:widgetbook/widgetbook.dart';
import './ServiceItem.dart';

ServiceItemStory() {
  return WidgetbookComponent(name: 'ServiceLineItem', useCases: [
    WidgetbookUseCase(
        name: 'ServiceLineItem',
        builder: (context) => Center(
            child: ServiceItem(
                service: ServiceModel(
                    name: "Service Name",
                    duration: "90 minutes",
                    price: "20.00",
                    description: "Test description")))),
  ]);
}
