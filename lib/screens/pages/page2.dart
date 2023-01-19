import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/screens/pages/detail.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: const Text('page2 title')),
        body: Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return Detail();
              },
            ));
          },
          child: const Text('I am page 2')),
    ));
  }
}
