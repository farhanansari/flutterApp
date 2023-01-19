import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/models/service.dart';

class AddService extends StatefulWidget {
  List<ServiceModel> services;
  final Function(ServiceModel) addService;

  AddService({super.key, required this.services, required this.addService});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> formData = {
    "name": {
      'label': 'Name',
      'errorText': 'Name is required',
      'isValid': true,
      'value': '',
      'required': true
    },
    "price": {
      'label': 'Price',
      'errorText': 'Price is required',
      'isValid': true,
      'value': '',
      'required': true
    },
    "duration": {
      'label': 'Duration',
      'errorText': 'Duration is required',
      'isValid': true,
      'value': '',
      'required': true
    },
    "description": {
      'label': 'Description',
      'errorText': 'Description is required',
      'isValid': true,
      'value': '',
      'required': true
    }
  };
  //@override
  _validate(key, value) {
    if (formData[key]["required"] == true && value.isEmpty) {
      return formData[key]["errorText"];
    }
    return null;
  }

  _save(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      widget.addService(ServiceModel(
          name: formData["name"]["value"],
          price: formData["price"]["value"],
          duration: formData["duration"]["value"],
          description: formData["description"]["value"]));
      Navigator.pop(context);
      print("All gooddd...");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Service"),
          centerTitle: true,
          actions: <Widget>[
            // Cancel button
            TextButton(
                onPressed: () {
                  print("button pressed");
                  Navigator.pop(context);
                },
                child: const Text('Cancel'))
          ],
          // Save button
          leading: TextButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              if (_formKey.currentState!.validate()) {
                print("All good saving...");
                print(formData);
                _save(context);
              }
            },
            child: const Text('Save'),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                    onChanged: (value) => formData["name"]["value"] = value,
                    decoration:
                        InputDecoration(labelText: formData["name"]["label"]),
                    validator: ((value) => _validate("name", value))),
                TextFormField(
                    onChanged: (value) => formData["price"]["value"] = value,
                    decoration:
                        InputDecoration(labelText: formData["price"]["label"]),
                    validator: ((value) => _validate("price", value))),
                TextFormField(
                    onChanged: (value) => formData["duration"]["value"] = value,
                    decoration: InputDecoration(
                        labelText: formData["duration"]["label"]),
                    validator: ((value) => _validate("duration", value))),
                TextFormField(
                    onChanged: (value) =>
                        formData["description"]["value"] = value,
                    decoration: InputDecoration(
                        labelText: formData["description"]["label"]),
                    validator: ((value) => _validate("description", value))),
              ],
            ),
          ),
        ));
  }
}
