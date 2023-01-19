import 'package:flutter/material.dart';

import '../../molecules/AboutMe/AboutMe.dart';

class SetupAboutMe extends StatelessWidget {
  const SetupAboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Setup About Me"),
          centerTitle: true,
          actions: <Widget>[
            // Cancel button
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'))
          ],
          leading: TextButton(onPressed: () {}, child: const Text('Save'))),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          AboutMe(),
        ],
      ),
    );
  }
}
