import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/screens/pages/detail.dart';
import 'package:flutter_widgetbook/services/auth.dart';

import '../../widgetbook/molecules/HeaderBar/HeaderBar.dart';

class NavigatorPage extends StatefulWidget {
  final Widget widget;
  final Widget title;
  const NavigatorPage({super.key, required this.widget, required this.title});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              return Scaffold(
                  //appBar: AppBar(title: widget.title),
                  appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(100),
                      child: HeaderBar(onSignOut: _auth.signOut)),

                  //appBar: AppBar(title: widget.title),
                  body: widget.widget
/*                   body: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) {
                            return widget.widget;
                          },
                        ));
                      },
                      child: const Text("Navigate")) */
                  );
            });
      },
    );

    /* return Column(children: <Widget>[
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return const Detail();
              },
            ));
          },
          child: const Text("Go"))
    ]); */
  }
}
