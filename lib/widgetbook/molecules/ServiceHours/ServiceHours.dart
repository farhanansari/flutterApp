import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/widgetbook/atoms/index.dart';

class ServiceHours extends StatefulWidget {
  String customTitle;
  ServiceHours({super.key, required this.customTitle});

  @override
  State<ServiceHours> createState() => _ServiceHoursState();
}

class _ServiceHoursState extends State<ServiceHours> {
  final Map<String, dynamic> serviceHours = HashMap();

  TimeOfDay sunday_time = const TimeOfDay(hour: 9, minute: 00);
  TimeOfDay monday_time = const TimeOfDay(hour: 9, minute: 00);
  TimeOfDay tuesday_time = const TimeOfDay(hour: 9, minute: 00);
  TimeOfDay wednesday_time = const TimeOfDay(hour: 9, minute: 00);
  TimeOfDay thursday_time = const TimeOfDay(hour: 9, minute: 00);
  TimeOfDay friday_time = const TimeOfDay(hour: 9, minute: 00);
  TimeOfDay saturday_time = const TimeOfDay(hour: 9, minute: 00);
  @override
  void initState() {
    _buildDefaultServiceHours();
    super.initState();
  }

  _buildDefaultServiceHours() {
    List days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];
    days.forEach((day) {
      serviceHours[day] = {
        "start": const TimeOfDay(hour: 9, minute: 00),
        "end": const TimeOfDay(hour: 18, minute: 00),
        "closed": false,
        "break": {
          "start": const TimeOfDay(hour: 9, minute: 00),
          "end": const TimeOfDay(hour: 9, minute: 00)
        }
      };
    });
  }

  _buildRows(day) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            SwitchButton(
                value: serviceHours[day]["closed"],
                onChange: (v) {
                  setState(() {
                    serviceHours[day]["closed"] = !serviceHours[day]["closed"];
                  });

                  //value = !value;
                }),
            Text(day)
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TimeSelector(setTime: (t) {
                setState(() {
                  serviceHours[day]["start"] = t;
                });
              }),
              TimeSelector(setTime: (t) {
                setState(() {
                  serviceHours[day]["end"] = t;
                });
              })
            ],
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.customTitle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Container(padding: EdgeInsets.all(10.0), child: _buildRows('Sunday')),
          Container(padding: EdgeInsets.all(10.0), child: _buildRows('Monday')),
          Container(padding: EdgeInsets.all(10), child: _buildRows('Tuesday')),
          Container(
              padding: EdgeInsets.all(10), child: _buildRows('Wednesday')),
          Container(padding: EdgeInsets.all(10), child: _buildRows('Thursday')),
          Container(padding: EdgeInsets.all(10), child: _buildRows('Friday')),
          Container(padding: EdgeInsets.all(10), child: _buildRows('Saturday')),
        ]);
  }
}
