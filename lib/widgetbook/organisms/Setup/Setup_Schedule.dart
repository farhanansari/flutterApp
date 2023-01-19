import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/widgetbook/molecules/index.dart';

class SetupSchedule extends StatelessWidget {
  const SetupSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Setup schedule page"),
          centerTitle: true,
          actions: <Widget>[
            // Cancel button
            TextButton(
                onPressed: () {
                  print("button pressed");
                  Navigator.pop(context);
                },
                child: const Text('Cancel'))
          ],
          leading: TextButton(onPressed: () {}, child: const Text('Save'))),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          const SizedBox(height: 20),
          ServiceHours(customTitle: 'Service Hours')
        ],
      ),
    );
  }
}
