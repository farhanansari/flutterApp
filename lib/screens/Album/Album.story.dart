import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './Album.dart';

AlbumStory() {
  return WidgetbookComponent(name: 'Album', useCases: [
    WidgetbookUseCase(
        name: 'Album', builder: (context) => Center(child: Album())),
  ]);
}
