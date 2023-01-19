import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  List<DropdownMenuItem<String>> dropdownItems;
  String selectedValue;
  final Function(String?) onChange;
  DropDown(
      {super.key,
      required this.dropdownItems,
      required this.selectedValue,
      required this.onChange});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget.selectedValue,
      onChanged: widget.onChange,
      items: widget.dropdownItems,
    );
  }
}
