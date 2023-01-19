import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/models/service.dart';
import 'package:flutter_widgetbook/widgetbook/molecules/Services/AddService.dart';
import 'package:flutter_widgetbook/widgetbook/molecules/Services/Services.dart';

class SetupServices extends StatefulWidget {
  const SetupServices({super.key});

  @override
  State<SetupServices> createState() => _SetupServicesState();
}

class _SetupServicesState extends State<SetupServices> {
  List<ServiceModel> services = [];

  addService(ServiceModel serviceToAdd) {
    print("Add service is calledddd");
    setState(() {
      services.add(serviceToAdd);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Setup Services"),
          centerTitle: true,
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel')),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AddService(
                          services: services, addService: addService);
                    },
                  ));
                },
                child: const Text("Add"))
          ]),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Services(
            services: services,
            addService: addService,
          )
        ],
      ),
    );
  }
}
