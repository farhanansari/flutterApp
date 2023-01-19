import 'package:flutter/material.dart';

import '../../molecules/Address/Address.dart';

class SetupAddress extends StatelessWidget {
  const SetupAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Setup Address"),
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
          Address(
            customTitle: 'Address',
          ),
        ],
      ),
    );
  }
}
