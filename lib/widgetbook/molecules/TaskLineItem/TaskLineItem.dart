import 'package:flutter/material.dart';

class TaskLineItem extends StatefulWidget {
  String title;
  String description;
  bool complete;

  TaskLineItem(
      {super.key,
      required this.title,
      required this.description,
      this.complete = false});

  @override
  State<TaskLineItem> createState() => _TaskLineItemState();
}

class _TaskLineItemState extends State<TaskLineItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(widget.complete
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.title),
                  Text(widget.description,
                      style: const TextStyle(fontSize: 10)),
                ],
              )
            ],
          ),
        ]);
  }
}
