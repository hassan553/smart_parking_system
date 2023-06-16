import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spark/core/constants/firebase_constants.dart';

import '../../../../core/constants/api.dart';
import '../../../auth/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class HomeRepo {
  Future<Either<String, UserModel>> getUserProfile(String token) async {
    try {
      http.Response response = await http.get(profileUrl, headers: {
        'lang': 'en',
        'Content-Type': 'application/json',
        "Authorization": token
      });

      return right(UserModel.fromJson(json.decode(response.body)));
    } catch (error) {
      return left(error.toString());
    }
  }

  // final ImagePicker _picker = ImagePicker();
  // String? _imageFile;
  // void _pickImage() async {
  //   try {
  //     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //     _imageFile = pickedFile!.path;
  //   } catch (e) {
  //     print("Image picker error " + e.toString());
  //   }
  // }
  File? file;
  final ImagePicker _picker = ImagePicker();
  Future chooseImage() async {
    file = (await _picker.pickImage(source: ImageSource.camera)) as File?;
// file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  void uploadImage(String token) {
    if (file == null) return;
    String base64Image = base64Encode(file!.readAsBytesSync());
    String fileName = file!.path.split("/").last;

    http.put(
      updateProfileUrl,
      body: json.encode(
        {
          "image": base64Image,
        },
      ),
      headers: {
        'lang': 'en',
        'Content-Type': 'application/json',
        "Authorization": token
      },
    ).then((res) {
      print(fileName);
    }).catchError((err) {
      print(err);
    });
  }

  
}

class ImageUploading {
  Future<void> uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = path.basename(imageFile.path);
      firebase_storage.Reference firebaseStorageRef =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);
      await firebaseStorageRef.putFile(imageFile);
      String imageUrl = await firebaseStorageRef.getDownloadURL();
      print('Image URL: $imageUrl');
      updateUserImage(imageUrl);
    } catch (e) {
      print(e.toString());
    }
  }


  Future<void> getImageAndUpload(BuildContext context, bool isCamera) async {
    final picker = ImagePicker();
    var pickedFile;
    if (isCamera) {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      await uploadImageToFirebase(imageFile);
    } else {}
  }

  Future updateUserImage(String imageUrl) async {
    try {
      firebaseFirestore
          .collection('users')
          .doc(user!.uid)
          .update({'image': imageUrl});
    } catch (error) {
      print(error);
    }
  }
}
