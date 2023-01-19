import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import '../../molecules/Address/Address.dart';

import './index.dart';

SetupStory() {
  return WidgetbookComponent(name: 'Setup', useCases: [
    WidgetbookUseCase(
        name: 'About Me',
        builder: (context) => const Center(child: SetupAboutMe())),
    WidgetbookUseCase(
        name: 'Address',
        builder: (context) => Center(
                child: Address(
              customTitle: 'test',
            ))),
    WidgetbookUseCase(
        name: 'Schedule',
        builder: (context) => const Center(child: SetupSchedule())),
    WidgetbookUseCase(
        name: 'Services',
        builder: (context) => const Center(child: SetupServices())),
  ]);
}
