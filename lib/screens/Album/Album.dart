import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Album extends StatefulWidget {
  bool useCropper = false;
  Album({super.key, useCropper});

  @override
  State<Album> createState() => _AlbumState();
}

class PhotoItem {
  final String image;
  final String name;
  PhotoItem(this.image, this.name);
}

class _AlbumState extends State<Album> {
  CroppedFile? _imageFile;
  final List _allImages = [];
  final ImagePicker _picker = ImagePicker();
  final List<String> _items = [];

  void takePhoto(ImageSource source) async {
    final pickedFile = (await _picker.pickImage(source: source));
    //_allImages.add(Image.asset("assets/profile.png"));

    if (pickedFile!.path != null) {
      //setStateIfMounted()
      if (mounted) {
        setState(() {
          _items.add(pickedFile.path);
        });
      }
/*       setState(() {
        //_allImages.add(Image.asset("assets/profile.png"));
        //_allImages.add(Image.file(File(pickedFile.path)));
        _items.add(
            "https://kaleidosblog.s3-eu-west-1.amazonaws.com/flutter_gallery/surfing-2212948_640.jpg");
      }); */

      print(_allImages);
    }
/*     widget.useCropper == true
        ? cropImage(pickedFile!)
        : setState(() {
            _allImages.add(Image.asset(pickedFile?.path.toString()));
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
          const Text("Choose Photo/Video", style: TextStyle(fontSize: 20.0)),
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

  Future<List<String>> fetchGalleryData() async {
    print("Fetch is called...");
    return _items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Album")),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.black,
          onPressed: () {
            showModalBottomSheet(
                isDismissible: true,
                context: context,
                builder: ((builder) => bottomSheet()));
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
            child: FutureBuilder<List<String>>(
          future: fetchGalleryData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    //image: NetworkImage(snapshot.data![index]),
                                    //image: AssetImage("assets/profile.png"),
                                    //image: Image.file(File(_items[index])),
                                    image: FileImage(File(_items[index])),
                                    fit: BoxFit.cover))));
                  });
            }
            return const Center(child: CircularProgressIndicator());
          },
        )));
  }
}
