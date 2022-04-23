import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Completeprofile extends StatefulWidget {
  Completeprofile({Key? key}) : super(key: key);

  @override
  State<Completeprofile> createState() => _CompleteprofileState();
}

class _CompleteprofileState extends State<Completeprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            CupertinoButton(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(imageFile!),
                  child: const Icon(
                    Icons.person,
                    size: 70,
                  ),
                ),
                onPressed: () {
                  showPhotoOptions();
                }),
            const TextField(
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            const SizedBox(
              height: 15,
            ),
            CupertinoButton(
              child: const Text("Submit"),
              onPressed: () {},
              color: Colors.blueAccent,
            ),
          ],
        ),
      )),
    );
  }

  File? imageFile;

  TextEditingController fullnamecontroller = TextEditingController();

  void selectImage(ImageSource local) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: local);

    if (pickedFile != null) {
      cropImages(pickedFile);
    }
  }

  void cropImages(XFile file) async {
    File? croppedImage = await ImageCropper().cropImage(
        sourcePath: file.path,
        compressQuality: 20,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));

    if (croppedImage != null) {
      setState(() {
        imageFile = croppedImage;
      });
    }
  }

  void showPhotoOptions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Upload Profile Picture"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                selectImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              leading: const Icon(Icons.photo_album_rounded),
              title: const Text("Select Image from Gallary"),
            ),
            ListTile(
              onTap: () {
                selectImage(ImageSource.camera);
                Navigator.pop(context);
              },
              leading: const Icon(Icons.camera_alt_rounded),
              title: const Text("Select Image from Camera"),
            ),
          ],
        ),
      ),
    );
  }
}
