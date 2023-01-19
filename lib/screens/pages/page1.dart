import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/widgetbook/molecules/index.dart';

class Page1 extends StatefulWidget {
  //const Page1({super.key});
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    Widget res = SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("page1 title")),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            Address(
              customTitle: 'Testingg',
            ),
            const SizedBox(height: 20),
            ServiceHours(
              customTitle: 'Service Hours',
            )
          ],
        )),
      ),
    );

    return res;
  }
}
