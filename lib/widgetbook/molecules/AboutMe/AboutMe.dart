import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/widgetbook/molecules/index.dart';

class AboutMe extends StatelessWidget {
  AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        const ProfileImage(),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(labelText: 'Bio'),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(labelText: 'Phone'),
        ),
      ],
    );
  }
}
