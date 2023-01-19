import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/widgetbook/atoms/index.dart';

class Address extends StatelessWidget {
  String customTitle = "Test Address";
  String? selectedLocationType = 'Commercial';
  String? selectedState = 'California';
  String? selectedCountry = 'United States';
  Address({super.key, required this.customTitle});

  List<DropdownMenuItem<String>> get locationTypesDropdown {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Commercial", child: Text("Commercial (Shop, Studio, etc)")),
      const DropdownMenuItem(
          value: "Residential",
          child: Text("Residential (Home, Apartment, etc")),
      const DropdownMenuItem(
          value: "Mobile", child: Text("Mobile (House-Calls Only")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get stateDropdown {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "California", child: Text("California")),
      const DropdownMenuItem(value: "New York", child: Text("New York")),
      const DropdownMenuItem(value: "Alabama", child: Text("Alabama")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get countryDropdown {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "United States", child: Text("United States")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(customTitle!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const Text('Location Type'),
        DropDown(
            dropdownItems: locationTypesDropdown,
            selectedValue: selectedLocationType!,
            onChange: (v) {
              selectedLocationType = v;
            }),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(labelText: 'Street Address'),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(labelText: 'City'),
        ),
        const SizedBox(height: 10),
        const Text('State'),
        DropDown(
            dropdownItems: stateDropdown,
            selectedValue: selectedState!,
            onChange: (v) {
              selectedState = v;
            }),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(labelText: 'Zip code'),
        ),
        const SizedBox(height: 10),
        const Text('Country'),
        DropDown(
            dropdownItems: countryDropdown,
            selectedValue: selectedCountry!,
            onChange: (v) {
              selectedCountry = v;
            })
      ],
    );
  }
}
