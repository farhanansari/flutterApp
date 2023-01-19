import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_widgetbook/widgetbook/molecules/index.dart';
import '../../../models/service.dart';

class Services extends StatefulWidget {
  final List<ServiceModel> services;
  final Function(ServiceModel) addService;
  Services({super.key, required this.services, required this.addService});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  //List<ServiceModel> services = [];
  List<Widget> list = <Widget>[];
  showServices() {
    for (var s in widget.services) {
      list.add(ServiceItem(service: s));
      list.add(const SizedBox(height: 20));
    }
    print(list);
    return Column(children: list);
  }

  @override
  Widget build(BuildContext context) {
    print(list.length);
    //return Text('testing');
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.services.length | 0,
        itemBuilder: ((context, index) {
          final item = widget.services[index];
          print(item.name);
          return Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext context) {
                      print("Delete pressed");
                    },
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,

                    //label: 'Delete',
                  ),
                ],
              ),
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: ServiceItem(service: item)));
        }));
  }
}
