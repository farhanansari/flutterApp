import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/models/service.dart';

class ServiceItem extends StatelessWidget {
  ServiceModel service;
  ServiceItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                service.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(service.duration),
              Text(service.description)
            ]),
        Text('\$${service.price}', style: const TextStyle(fontSize: 20))
      ],
    );
  }
}
