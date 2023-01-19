import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/screens/profile/profile.dart';
import 'package:flutter_widgetbook/widgetbook/molecules/index.dart';
import 'package:flutter_widgetbook/widgetbook/organisms/Setup/Setup_Photos.dart';
import 'package:flutter_widgetbook/widgetbook/organisms/Setup/index.dart';

class SetupHome extends StatelessWidget {
  const SetupHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        const Text('Design Booth'),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return const SetupAddress();
              },
            ));
          },
          child: TaskLineItem(
              title: "Setup Address",
              description: "Choose when my clients can book"),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return const SetupSchedule();
              },
            ));
          },
          child: TaskLineItem(
              title: "Setup Schedule",
              description: "Choose when my clients can book"),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return const SetupServices();
              },
            ));
          },
          child: TaskLineItem(
              title: "Setup Services",
              description: "Add the services my clients can book"),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return const SetupAboutMe();
              },
            ));
          },
          child: TaskLineItem(
              title: "Setup About Me", description: "Setup your profile page"),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return Album(
                  useCropper: true,
                );
              },
            ));
          },
          child: TaskLineItem(
              title: "Setup Photos", description: "Setup your work"),
        ),
        // Make an atom.....
      ],
    );
  }
}
