import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tms/constants/colors/colors.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String? _imageUrl;
  bool _uploading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_uploading)
              CircularProgressIndicator() // Show loading indicator while uploading
            else if (_imageUrl != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(_imageUrl!),
              ),
            ElevatedButton(
              onPressed: _uploading ? null : () => _uploadImage(context), // Disable button while uploading
              child: Text(
                'Upload Image',
                style: TextStyle(color: blackColor),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _uploadImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    try {
      setState(() {
        _uploading = true;
      });
      final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        String fileName = pickedImage.name.toString();
        Reference storageReference = FirebaseStorage.instance.ref().child('images/$fileName');

        UploadTask uploadTask = storageReference.putFile(File(pickedImage.path));
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
        String imageUrl = await taskSnapshot.ref.getDownloadURL();

        await FirebaseFirestore.instance.collection('images').add({'url': imageUrl});

        // Update _imageUrl and trigger a rebuild
        setState(() {
          _imageUrl = imageUrl;
          _uploading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image uploaded successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        setState(() {
          _uploading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No image picked!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      setState(() {
        _uploading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to upload image: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
