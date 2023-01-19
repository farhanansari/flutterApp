import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './ProfileImage.dart';

ProfileImageStory() {
  return WidgetbookComponent(name: 'ProfileImage', useCases: [
    WidgetbookUseCase(
        name: 'Profile Image',
        builder: (context) => const Center(child: ProfileImage())),
  ]);
}
