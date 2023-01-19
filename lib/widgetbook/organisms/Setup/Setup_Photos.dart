import 'package:flutter/material.dart';

class AddPhotos extends StatelessWidget {
  const AddPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.black,
          onPressed: () {
            //showBottomSheet(
            //context: context, builder: ((builder) => bottomSheet()));
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("Setup Photos"),
          centerTitle: true,
          actions: <Widget>[
            // Cancel button
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'))
          ],
          leading: TextButton(onPressed: () {}, child: const Text('Save')),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Image.asset("assets/profile.png")),
                Expanded(child: Image.asset("assets/profile.png")),
                Expanded(child: Image.asset("assets/profile.png")),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(child: Image.asset("assets/profile.png")),
                Expanded(child: Image.asset("assets/profile.png")),
                Expanded(child: Image.asset("assets/profile.png")),
              ],
            )
          ],
        ));
  }
}
