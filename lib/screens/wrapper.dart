import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/models/user.dart';
import 'package:flutter_widgetbook/screens/authenticate/authenticate.dart';
import 'package:flutter_widgetbook/screens/home/home.dart';

import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
