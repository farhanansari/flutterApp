import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/widgetbook/molecules/AboutMe/AboutMe.dart';
import 'package:flutter_widgetbook/widgetbook/molecules/index.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Setup Profile"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[AboutMe()],
        ));
  }
}
