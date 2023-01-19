import 'package:flutter/material.dart';

class TimeSelector extends StatefulWidget {
  final Function(TimeOfDay) setTime;
  TimeSelector({super.key, required this.setTime});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  TimeOfDay _time = const TimeOfDay(hour: 9, minute: 00);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      //initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: _time,
    );

    if (newTime != null) {
      widget.setTime(newTime);
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: _selectTime, child: Text('${_time.format(context)}'));
  }
}
