import 'package:flutter/material.dart';

class HeaderBar extends StatefulWidget {
  final VoidCallback onSignOut;
  Widget? title = const Text('theCuts');
  HeaderBar({super.key, required this.onSignOut, this.title});

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('theCuts'),
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton(
                onPressed: widget.onSignOut, child: const Text('Sign out'))
          ]),
    );
  }
}
