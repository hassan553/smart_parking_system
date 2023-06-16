import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spark/core/constants/firebase_constants.dart';
import 'package:spark/features/auth/data/model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class SettingRepo {
  Future<UserModel> getUserDataFromFirebase() async {
    UserModel userModel;
    DocumentSnapshot<Map<String, dynamic>> result =
        await firebaseFirestore.collection('users').doc(user!.uid).get();
    print('result${result.data()}');
    userModel = UserModel.fromJson(
      result.data(),
    );
    return userModel;
  }

  Future<List<CarModel>> getUserCarDataFromFirebase() async {
    List<CarModel> listOfCars=[];
    QuerySnapshot<Map<String, dynamic>> result = await firebaseFirestore
        .collection('users')
        .doc(user!.uid)
        .collection('cars')
        .get();

    result.docs.forEach((element) {
      listOfCars.add(CarModel.fromJson(element.data()));
    });
    print(listOfCars);
    return listOfCars;
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
      pickedFile = await picker.pickImage(source: ImageSource.camera);
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
