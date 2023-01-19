import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  bool value;
  final Function(bool) onChange;
  Color activateColor;
  SwitchButton(
      {super.key,
      required this.value,
      required this.onChange,
      this.activateColor = Colors.green});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(context) {
    return Switch(
        onChanged: widget.onChange,
        value: widget.value,
        activeColor: widget.activateColor);
  }
}
