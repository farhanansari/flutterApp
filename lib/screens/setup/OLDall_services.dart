import 'package:flutter/material.dart';

import '../../widgetbook/molecules/Services/Services.dart';

class AllServices extends StatelessWidget {
  const AllServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Services(
      addService: (ServiceModel) {},
      services: [],
    );
  }
}
