import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  CroppedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final pickedFile = (await _picker.pickImage(source: source));
    if (mounted && pickedFile != null) {
      cropImage(pickedFile);
    }

/*     setState(() {
      _imageFile = pickedFile as XFile;
    }); */
  }

  cropImage(XFile pickedFile) async {
    CroppedFile cropped = (await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0)))
        as CroppedFile;
    setState(() {
      _imageFile = cropped;
    });
  }

  Widget bottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: <Widget>[
          const Text("Choose Profile Photo", style: TextStyle(fontSize: 20.0)),
          const SizedBox(height: 20),
          Row(children: <Widget>[
            TextButton(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                child: const Text("Camera")),
            TextButton(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                child: const Text("Gallary"))
          ])
        ]));
  }

//AssetImage("assets/profile.png")
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
            radius: 80.0,
            backgroundImage: _imageFile == null
                ? const AssetImage("assets/profile.png")
                : FileImage(File(_imageFile!.path)) as ImageProvider),
        Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                print("Clicked...");
                showModalBottomSheet(
                    context: context, builder: ((builder) => bottomSheet()));
              },
              child:
                  const Icon(Icons.camera_alt, color: Colors.teal, size: 28.0),
            ))
      ],
    );
  }
}
