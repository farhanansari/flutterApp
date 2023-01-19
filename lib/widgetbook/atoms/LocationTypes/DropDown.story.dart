import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'DropDown.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "USA", child: Text("USA")),
    const DropdownMenuItem(value: "Canada", child: Text("Canada")),
    const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
    const DropdownMenuItem(value: "England", child: Text("England")),
  ];
  return menuItems;
}

DropDownStory() {
  String? selectedValue;
  return WidgetbookComponent(name: 'DropDown', useCases: [
    WidgetbookUseCase(
      name: 'DropDown',
      builder: (context) => Center(
          child: DropDown(
        dropdownItems: dropdownItems,
        selectedValue: 'England',
        onChange: (v) {
          selectedValue = v;
        },
      )),
    )
  ]);
}
